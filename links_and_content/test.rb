require 'rubygems'
require 'selenium-webdriver'
require 'require_all'
require 'headless'
require 'csv'
require 'fileutils'
require_all 'common'


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
$url = "#{$root_url}jobs-by-location"

$driver.get($url)





RSpec.describe "Jobs By Location" do
  before(:all) do
    @locations_data = CSV.read("./job_locations.csv", headers: true)
    @links = $driver.find_elements(class: "search_links")
    @links_content = {}
    @links.each {|link|
      key = link.find_element(tag_name: "a").attribute("href")
      value = link.find_element(tag_name: "a").text
      @links_content[key] = value
    }
  end

    # @locations_data = CSV.read("./job_locations.csv", headers: true)
    # before(:all) do
    #   links = $driver.find_elements(class: "search_links")
    #   links_content = {}
    #   links.each {|link|
    #     key = link.find_element(tag_name: "a").attribute("href")
    #     value = link.find_element(tag_name: "a").text
    #     links_content[key] = value
    #   }
    #end
    it "has correct links" do
      @locations_data.each{ |location_row|
        p location_row['salesforce']
        location_url = location_row['safesforce']
        p location_url
        location_url = location_url.gsub(" ", "-").downcase
        expected_link = "#{root_url}jobs-#{location_url}"
        expect(@links_content.has_key?(location_url)).to be_truthy
        expect(@links_content[location_url]).to eq("Jobs in #{location_row['salesforce']}")
      }
    end


end
#header("#{$url}")
#nav("#{$url}")
#share("#{$url}")
#footer("#{$url}")
#ssearch("#{$url}")
