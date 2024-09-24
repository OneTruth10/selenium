require 'selenium-webdriver'
require 'csv'

driver = Selenium::WebDriver.for :firefox

driver.get 'https://www.gla.ac.uk/apps/uofglife/#/login'

wait = Selenium::WebDriver::Wait.new
wait.until { driver.find_element(tag_name: "input") }
puts "page loaded"
sleep 2

driver.find_element(id: "guid").send_keys '3036012n'
driver.find_element(id: "password").send_keys 'k@zuma051o'
sleep 1
driver.find_element(class: "loginButton").click
puts "password given"
wait.until { driver.find_element(class: "viewButtonContainer") }
sleep 1
driver.find_element(xpath: "/html/body/div/div/div/section[1]/div[2]/div[2]/button").click
sleep 5

wkAgenda = driver.find_elements(class: "weekViewContainer")
wkAgenda.each { |w|
    puts "hello"
    perDay = driver.find_elements(class: "agendaContainer Week")
    perDay.each do |d|
        date = d.find_element(tag_name: "h1").text
        puts date
        event = d.find_elements(class: "agendaEvent")
        event.each do |e|
            starting_time = e.find_element(tag_name: "p").text
            ending_time = e.find_element(tag_name: "br").text
            title = e.find_element(class: "event-title").text
            location = e.find_element({relative: {tag_name: 'h2', below: {tag_name: 'br'}, below: {tag_name:'div'}}})
            puts "lol"
        end   
    end
}

driver.quit