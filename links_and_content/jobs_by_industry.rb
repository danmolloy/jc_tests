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
  $url = "#{$root_url}jobs-by-industry"

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
  string.gsub!("<br/>", "")
  string.strip!
  return string
end

run do

  RSpec.describe "Jobs By Industry" do
    before(:all) do
    end
    it "has correct title" do
      expect($driver.title).to eq("JobContax | Jobs By Industry")
    end
    it "has correct header" do
      expect($driver.find_element(tag_name: "h1").text).to eq("Jobs by Industry")
    end
    describe "Industry Links" do
      @industries_data = CSV.read("./industry.csv", headers: true)
      links = $driver.find_elements(class: "industry_btn")
      $links_content = {}
      links.each {|link|
        key = link.find_element(tag_name: "a").attribute("href")
        value = link.find_element(tag_name: "a").text
        $links_content[key] = value
      }
      @industries_data.each{ |industry_row|
        it "has link to #{industry_row['salesforce'].gsub('-', ' ').split.map(&:capitalize).join(' ')}" do
          industry_url = industry_row['salesforce'].downcase.gsub(" ", "-")
          industry_url = "#{$root_url}#{industry_url}"
          expect($links_content.has_key?(industry_url)).to be_truthy
          expect($links_content[industry_url]).to eq("#{industry_row['salesforce'].split('-').map(&:capitalize).join('-')}")
        end
      }
      @industries_data.each{ |industry_row|
        it "#{industry_row['salesforce'].gsub('-', ' ').split.map(&:capitalize).join(' ')} page is generated correctly" do
          industry_url = industry_row['salesforce'].downcase.gsub(" ", "-")
          industry_url = "#{$root_url}#{industry_url}"
          $driver.navigate.to(industry_url)
          expect($driver.title.gsub("  ", " ").strip).to eq(industry_row['page_title'].gsub("  ", " ").strip)
          expect($driver.find_element(xpath: "//meta[@name='description']").attribute("content")).to eq(industry_row['meta_description'])
          expect($driver.find_element(id: "industry_header").text).to eq("#{industry_row['salesforce'].gsub('-', ' ')}")
          expect(clean($driver.find_element(id: "page_text").text)).to eq(clean(industry_row['paragraph']))
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
