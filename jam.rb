require 'rubygems'
require 'sinatra'
require 'haml'
require 'serialport'
require 'logger'
require "selenium-webdriver"

set :haml, { format: :html5, attr_wrapper: '"'}

get '/' do
  logger = Logger.new(STDOUT)
  logger.level = Logger::DEBUG

  logger.debug("sd")

  haml :index
end

get '/value' do
  driver = Selenium::WebDriver.for :firefox
  driver.navigate.to "http://localhost:4567/"
  element = driver.find_element(:id, "list")

  jam_value = element.text
end
