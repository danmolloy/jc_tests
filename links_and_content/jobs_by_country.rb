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
  $url = "#{$root_url}jobs-by-country"

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

  RSpec.describe "Jobs By Country" do
    before(:all) do
    end
    it "has correct title" do
      expect($driver.title).to eq("JobContax | Jobs By Country")
    end
    it "has correct header" do
      expect($driver.find_element(tag_name: "h1").text).to eq("Jobs by Country")
    end
    describe "Country Links" do
      @countries_data = CSV.read("./country.csv", headers: true)
      $locations_data = CSV.read("./job_locations.csv", headers: true)
      @locations = []
      $locations_data.each {|location_row|
        @locations << location_row['salesforce']
      }
      links = $driver.find_elements(class: "search_links")
      $links_content = {}
      links.each {|link|
        key = link.find_element(tag_name: "a").attribute("href")
        value = link.find_element(tag_name: "a").text
        $links_content[key] = value
      }
      @countries_data.each{ |country_row|
        it "has link to #{country_row['salesforce']}" do
          country_url = country_row['salesforce'].downcase.gsub(" ", "-")
          country_url = "#{$root_url}jobs-#{country_url}"
          expect($links_content.has_key?(country_url)).to be_truthy
          expect($links_content[country_url]).to eq("Jobs in #{country_row['salesforce']}")
        end
      }
      @countries_data.each{ |country_row|
        if @locations.include?(country_row['salesforce'])
          it "#{country_row['salesforce']} page is generated correctly" do
            location_row = ""
            $locations_data.each {|row|
              if row['salesforce'] == country_row['salesforce']
                location_row = row
              end
            }
            location_url = location_row['salesforce'].downcase.gsub(" ", "-")
            location_url = "#{$root_url}jobs-#{location_url}"
            $driver.navigate.to(location_url)
            expect($driver.title).to eq(location_row['page_title'])
            expect($driver.find_element(xpath: "//meta[@name='description']").attribute("content")).to eq(location_row['meta_description'])
            expect($driver.find_element(id: "top_header_small").text).to eq("Jobs in #{location_row['salesforce']}")
            expect(clean($driver.find_element(id: "page_text").text)).to eq(clean(location_row['paragraph']))
            expect($driver.find_element(id: "results_header").text).to eq("Jobs #{location_row['salesforce']}")
            expect($driver.find_element(id: "results_column_headers").displayed?).to be_truthy
          end
        else
          it "#{country_row['salesforce']} page is generated correctly" do
            country_url = country_row['salesforce'].downcase.gsub(" ", "-")
            country_url = "#{$root_url}jobs-#{country_url}"
            $driver.navigate.to(country_url)
            expect($driver.title).to eq(country_row['page_title'])
            expect($driver.find_element(xpath: "//meta[@name='description']").attribute("content")).to eq(country_row['meta_description'])
            expect($driver.find_element(id: "top_header_small").text).to eq("Jobs in #{country_row['salesforce']}")
            expect(clean($driver.find_element(id: "page_text").text)).to eq(clean(country_row['paragraph']))
            expect($driver.find_element(id: "results_column_headers").displayed?).to be_truthy
          end
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
