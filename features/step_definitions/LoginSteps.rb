require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
require 'rspec/expectations'
include RSpec::Matchers

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
driver = Selenium::WebDriver.for :chrome, options: options

Given('open web {string}') do |string|
  string = driver.navigate.to "https://tap-dev.tripatra.com/"
  if string == "https://tap-dev.tripatra.com/)"   ###verify Web
      assert true
  end
end
  
Then('user input username') do
  driver.find_element(:name,'email').send_keys 'tap.admin@tripatra.com'
    
end
  
Then('user input password') do
  driver.find_element(:name,'password').send_keys 't4pTr1p47r@2020'
    
end
  
Then('user click on Sign In button') do
  driver.find_element(:xpath, '//*[@id="__next"]/div/div/div/div[2]/div/form/button').click
  driver.manage.timeouts.implicit_wait = 5
end

Then('I should see homepage as {string}') do |string|
  driver.find_element(:xpath, '//*[@id="demo-simple-select-outlined"]').click
  string = driver.find_element(:xpath, '//*[@id="menu-"]/div[3]/ul/li').text
  string.should == "Super Administrator - All Projects"    ###Verify User Status

end