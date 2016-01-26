require 'rubygems'
require 'selenium-webdriver'
require 'require_all'
require 'headless'
require 'csv'
require 'fileutils'
require_all 'common'

def setup
  #$headless = Headless.new
  #$headless.start
  $driver = Selenium::WebDriver.for :chrome
  $driver.manage.window.resize_to(1300, 900)
  $driver.manage.timeouts.implicit_wait = 10
  if ENV["SITE"] == "test"
    $root_url = "http://www.testsbw6h8.jobcontax.com/"
    puts "running tests on TEST site: #{$root_url}"
  elsif (ENV["SITE"] == "live") || (ENV["SITE"] == "prod")
    $root_url = "http://www.jobcontax.com/"
    puts "running tests on PRODUCTION site: #{$root_url}"
  end
  $url = "#{$root_url}jobs-by-city"

  $driver.get($url)
end

def run
  setup
  yield
end

def clean(string)
  string.gsub!("<br>", "")
  string.gsub!("\n", "")
  string.gsub!(" ", "")
  string.gsub!("\r", "")
  string.strip!
  return string
end

run do

  RSpec.describe "Jobs By City" do
    before(:all) do
    end
    it "has correct title" do
      expect($driver.title).to eq("JobContax | Jobs By City")
    end
    it "has correct header" do
      expect($driver.find_element(tag_name: "h1").text).to eq("Jobs by City")
    end
    describe "City Links" do
      @cities_data = CSV.read("./city.csv", headers: true)
      links = $driver.find_elements(class: "search_links")
      $links_content = {}
      links.each {|link|
        key = link.find_element(tag_name: "a").attribute("href")
        value = link.find_element(tag_name: "a").text
        $links_content[key] = value
      }
      @cities_data.each{ |city_row|
        it "has link to #{city_row['salesforce']}" do
          city_url = city_row['salesforce'].downcase.gsub(" ", "-")
          city_url = "#{$root_url}jobs-in-#{city_url}"
          expect($links_content.has_key?(city_url)).to be_truthy
          expect($links_content[city_url]).to eq("Jobs in #{city_row['salesforce']}")
        end
      }
      @cities_data.each{ |city_row|
        it "#{city_row['salesforce']} page is generated correctly" do
          city_url = city_row['salesforce'].downcase.gsub(" ", "-")
          city_url = "#{$root_url}jobs-in-#{city_url}"
          $driver.navigate.to(city_url)
          expect($driver.title).to eq(city_row['page_title'])
          expect($driver.find_element(xpath: "//meta[@name='description']").attribute("content")).to eq(city_row['meta_description'])
          expect($driver.find_element(id: "top_header_small").text).to eq("Jobs in #{city_row['salesforce'].gsub("-", " ")}")
          expect(clean($driver.find_element(id: "page_text").text)).to eq(clean(city_row['paragraph']))
          expect($driver.find_element(id: "results_column_headers").displayed?).to be_truthy

        end
      }
    end




  end
  #header("#{$url}")
  #nav("#{$url}")
  #share("#{$url}")
  #footer("#{$url}")
  #ssearch("#{$url}")
end
