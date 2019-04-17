require 'selenium-webdriver'
# require_relative 'login_page.rb'

class PageElement

  def initialize(url)
    @driver=Selenium::WebDriver.for :firefox
    @driver.manage.window.maximize
    @driver.navigate.to url
  end
  
  def login_username()
    return @driver.find_element(:id,'CustomerEmail')
  end
  
  def login_password()
    return @driver.find_element(:id,'CustomerPassword')
  end
  
  def submit_button()
    return @driver.find_element(:class,'btn--primary')
  end
  
  def my_account_link()
    @driver.find_element(:class,'header__account-nav-link--account')
  end

  def logout_link()
    @driver.find_element(:class,'icon-signout')
  end 
  
  def recover_password()
   return @driver.find_element(:id,'RecoverPassword')
  end

  def cancel_recover_password()
    @driver.find_element(:id,'HideRecoverPasswordLink')
  end

  def close_browser()
    @driver.quit
  end
end
