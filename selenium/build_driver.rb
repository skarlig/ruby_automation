require 'bundler/setup'
require 'selenium-webdriver'

def setup
  browser = ENV['BROWSER']
  hub_ip = ENV['HUB_HOST']
  hub_port = ENV['PORT']

  puts "Browser: " + browser
  puts "ip: " + hub_ip
  puts "port: " + hub_port

  hub_url = "http://#{hub_ip}:#{hub_port}/wd/hub"
  @driver = Selenium::WebDriver.for(:remote, url: hub_url, desired_capabilities: browser)
  @driver.manage.window.size = Selenium::WebDriver::Dimension.new(1920, 1080)
  @driver.manage.timeouts.implicit_wait = 10
end

def teardown
  @driver.quit
end

def run
  setup
  yield
  teardown
end

run do
  @driver.get 'https://de.dawanda.com'
  @driver.find_element(:css, "#shared_header_logo")
  @driver.save_screenshot(File.join(Dir.pwd, "dawanda_logo.png"))
end
