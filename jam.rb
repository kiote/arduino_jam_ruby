require 'rubygems'
require 'sinatra'
require 'haml'
require 'serialport'
require 'logger'
require 'selenium-webdriver'

set :haml, { format: :html5, attr_wrapper: '"'}

get '/' do
  haml :index
end

get '/value' do
  driver = Selenium::WebDriver.for :firefox
  driver.navigate.to "http://localhost:4567/"
  element = driver.find_element(:id, "list")

  jam_value = element.text
  write_to_sp(jam_value)
end

def write_to_sp(value)
  logger = Logger.new(STDOUT)
  logger.level = Logger::DEBUG

  port_str = "/dev/tty.usbmodem1411" 
  baud_rate = 9600
  data_bits = 8
  stop_bits = 1
  parity = SerialPort::NONE
   
  sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
  logger.debug(sp)
  sp.write(value)
  logger.debug(value)
  sp.close 
end
