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
  $url = "#{$root_url}jobs-by-title"

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

  RSpec.describe "Jobs By Title" do
    before(:all) do
    end
    it "has correct title" do
      expect($driver.title).to eq("JobContax | Jobs By Title")
    end
    it "has correct header" do
      expect($driver.find_element(tag_name: "h1").text).to eq("Jobs by Title")
    end
    describe "Title Links" do
      @titles_data = CSV.read("./csv_preset.csv", headers: true)
      links = $driver.find_elements(class: "search_links")
      $links_content = {}
      links.each {|link|
        key = link.find_element(tag_name: "a").attribute("href")
        value = link.find_element(tag_name: "a").text
        $links_content[key] = value
      }
      @titles_data.each{ |title_row|
        it "has link to #{title_row['salesforce'].gsub('-', ' ').split.map(&:capitalize).join(' ')}" do
          title_url = title_row['salesforce'].downcase.gsub(" ", "-")
          title_url = "#{$root_url}#{title_url}"
          expect($links_content.has_key?(title_url)).to be_truthy
          expect($links_content[title_url]).to eq("#{title_row['salesforce'].gsub('-', ' ').split.map(&:capitalize).join(' ')}")
        end
      }
      @titles_data.each{ |title_row|
        it "#{title_row['salesforce'].gsub('-', ' ').split.map(&:capitalize).join(' ')} page is generated correctly" do
          title_url = title_row['salesforce'].downcase.gsub(" ", "-")
          title_url = "#{$root_url}#{title_url}"
          $driver.navigate.to(title_url)
          expect($driver.title.gsub("  ", " ").strip).to eq(title_row['page_title'].gsub("  ", " ").strip)
          expect($driver.find_element(xpath: "//meta[@name='description']").attribute("content")).to eq(title_row['meta_description'])
          expect($driver.find_element(id: "job_header").text).to eq("#{title_row['salesforce'].gsub('-', ' ').split.map(&:capitalize).join(' ')}")
          expect(clean($driver.find_element(id: "page_text").text)).to eq(clean(title_row['paragraph']))
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
