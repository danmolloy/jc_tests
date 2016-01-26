require 'rubygems'
require 'selenium-webdriver'
require 'require_all'
require 'headless'
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

  $driver.get($root_url)
end

def run
  setup
  yield
end

run do
  RSpec.describe "Home" do
    it "has correct title" do
      expect($driver.title).to eq("JobContax | Biotech | Pharma | Engineering | Construction")
    end
  end
  header("#{$root_url}")
  nav("#{$root_url}")
  share("#{$root_url}")
  footer("#{$root_url}")
  search("#{$root_url}")
end
