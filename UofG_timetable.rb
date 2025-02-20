require 'selenium-webdriver'
require 'csv'
require 'google/apis/calendar_v3'

puts "When is the begining of the week?(e.g. 23sep)"
start_from = gets

driver = Selenium::WebDriver.for :firefox

driver.get 'https://www.gla.ac.uk/apps/uofglife/#/login'

wait = Selenium::WebDriver::Wait.new
wait.until { driver.find_element(tag_name: "input") }
puts "page loaded"
sleep 2

driver.find_element(id: "guid").send_keys '[ID]'
driver.find_element(id: "password").send_keys '[Password]'
sleep 1
driver.find_element(class: "loginButton").click
puts "password given"
wait.until { driver.find_element(class: "viewButtonContainer") }
sleep 1
driver.find_element(xpath: "/html/body/div/div/div/section[1]/div[2]/div[2]/button").click
sleep 5
driver.find_element(xpath: "/html/body/div/div/div/div[3]/div[2]/button[3]").click
sleep 1
i = 1   #i for making new row in csv
agenda = [["Date", "Begins from", "Ends at", "Title", "Location"]]
wkAgenda = driver.find_elements(class: "weekViewContainer")
wkAgenda.each { |w|
    perDay = w.find_elements(tag_name: "table")
    perDay.each do |d|
        date = d.find_element(tag_name: "h1").text
        puts "\nDate: #{date}"
        event = d.find_elements(class: "agendaEvent")
        event.each do |e|
            time = e.find_element(class: "class-times").text.split("\n")
            starting_time = time[0]
            ending_time = time[2]
            text = []
            j = 0
            agenda_text = e.find_elements(tag_name: "h2")
            agenda_text.each do |a|
                text[j] = a.text
                #puts a.text
                j += 1
            end
            title = text[0]
            location = text[1]
            #puts "#{title}, #{location}"
            #title = e.find_element(class: "event-title").text
            #location = e.find_element({relative: {tag_name: 'h2', below: {class: "event-title"}}}).text
            agenda[i] = [date, starting_time, ending_time, title, location]
            puts "#{agenda}"
            i += 1
        end   
    end
}
File.write("timetable#{start_from}.csv", agenda.map(&:to_csv).join)

driver.quit
