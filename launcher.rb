require 'rubygems'
require 'selenium-webdriver'

# Input capabilities
caps = Selenium::WebDriver::Remote::Capabilities.new

driver = Selenium::WebDriver.for(:firefox)
driver.navigate.to "http://localhost:4567/value"
puts driver.title
driver.quit