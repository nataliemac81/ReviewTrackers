require 'test/unit'
require 'selenium-webdriver'
require_relative 'page_elements.rb'

class LoginPage < Test::Unit::TestCase

  def test_forgot_password_link
    browser = PageElement.new("https://www.gouletpens.com/account/login")
    
    browser.recover_password.click

    wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
    wait.until {browser.cancel_recover_password}

    cancelPasswordButton = browser.cancel_recover_password.displayed?
    
    assert_equal(true, cancelPasswordButton,'cancel recover password button display')

    browser.close_browser
  end 

  def test_login
    browser = PageElement.new("https://www.gouletpens.com/account/login")
    #input user name
    browser.login_username.send_keys('nataliemccroy@gmail.com')
  
    browser.login_password.send_keys('testxyz')

    #click on submit button
    browser.submit_button.click

    #wait until the My Account link displays, timeout in 10 seconds
    wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
    wait.until {browser.my_account_link}

    browser.my_account_link.click

    #wait until the Logout link displays, timeout in 10 seconds
    wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
    wait.until {browser.my_account_link}


    #if logout link is displayed
    logout_linkDisplayed = browser.logout_link.displayed?

    puts logout_linkDisplayed

    #do assertion on logout link
    assert_equal(true,logout_linkDisplayed,'my account link display')
    
    browser.close_browser
  end
end