require 'httparty'
require 'json'


aroundwhereat = 'America'
bemorespecific = 'Boise'

url = "http://worldtimeapi.org/api/timezone/#{aroundwhereat}/#{bemorespecific}"

response = HTTParty.get(url)

if response.code == 200
    timetime = JSON.parse(response.body)

    datetoday = timetime['datetime'].split('T').first
    igottimetoday = timetime['datetime'].split('T').last.split('.').first

    puts "The current time in #{aroundwhereat}/#{bemorespecific} is #{datetoday} #{igottimetoday}"
else
    puts "Error: #{response.code}"
end
