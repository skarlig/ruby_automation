require 'rubygems'
require 'selenium-webdriver'

firefoxDriver = Selenium::WebDriver.for :firefox
firefoxDriver.get 'https://www.ecosia.org/'
firefoxDriver.find_element(:css, "#searchInput").send_keys("Testfall")
firefoxDriver.find_element(:css, ".icon-search").click


puts "Page title is #{firefoxDriver.title}"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { firefoxDriver.title.downcase.start_with? "testfall" }

puts "Page title is #{firefoxDriver.title}"
firefoxDriver.quit
