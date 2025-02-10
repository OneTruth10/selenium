require 'selenium-webdriver'
require 'net/http'
require 'uri'
require 'json'

exe_path = 'C:\Users\fires\.cache\selenium\geckodriver\win64\0.32.0\geckodriver.exe'
options = Selenium::WebDriver::Firefox::Options.new
options.profile = Selenium::WebDriver::Firefox::Profile.new('C:\Instagram_spam\tmp')
driver = Selenium::WebDriver.for :firefox, options:options


driver.get "https://twitter.com/login?lang=ja"
sleep 6
driver.find_element(:xpath, '/html/body/div/div/div/div[1]/div/div/div/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div/div[5]/label/div/div[2]/div/input').click
driver.find_element(:xpath, '/html/body/div/div/div/div[1]/div/div/div/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div/div[5]/label/div/div[2]/div/input').send_keys('sub_cactus',:return)


sleep 2
driver.find_element(:name,'password').send_keys('k@zuma051o')
driver.find_element(:name,'password').send_keys(:return)
sleep 3
driver.navigate.to('https://twitter.com/y_03715/with_replies')
sleep 2
t = DateTime.now
newT = DateTime.now
for i in 1..100000 do
article = driver.find_element(:tag_name, 'article')
#articles.each do |a|

  varTime = article.find_element(:tag_name,'time').attribute('datetime')
  newT = DateTime.parse(varTime)
  newT = newT.new_offset(Rational(9,24))
  check = true
  puts newT
  puts t
  params = Hash.new
  if t<newT
    text = driver.find_element(:xpath, "/html/body/div[1]/div/div/div[2]/main/div/div/div/div/div/div[3]/div/div/section/div/div/div[1]/div/div/div/article/div/div/div/div[2]/div[2]/div[2]/div[1]/div/span").text
    driver.find_element(:xpath, "//div[@data-testid='reply']").click
    puts text
    #key = ENV['DZZmoYHk586iHIk3n7854gK6R9tYR5yF']
    params = {apikey: 'DZZmoYHk586iHIk3n7854gK6R9tYR5yF', query: text}
    uri = 'https://api.a3rt.recruit.co.jp/talk/v1/smalltalk'
    uri = URI.parse(uri)
    response = Net::HTTP.post_form(uri, params)
    data = JSON.parse(response.body)
    message = {
        type: 'text',
        text: data['results'][0]['reply']
        }
    answer = message[:text]
    puts answer
    sleep 2
    puts "Replying!"
    driver.find_element(:xpath,'//div[@aria-label="Tweet text"]').send_keys("#{answer} \n Sent by bot")
    driver.find_element(:xpath,'/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div/div/div[2]/div[2]/div/div/div/div[3]/div/div[2]/div/div/div/div/div[2]/div[3]/div/div/div[2]/div[2]').click

  end
  t = newT
  driver.navigate.to('https://twitter.com/y_03715/with_replies')
  sleep 60
end




   