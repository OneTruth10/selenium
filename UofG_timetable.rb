require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox

driver.get 'https://selenium.dev'

driver.quit