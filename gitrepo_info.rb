require 'httparty'
require 'json'
username = 'annathehybrid'
response = HTTParty.get("https://api.github.com/users/#{username}/repos") 

if response.code == 200
    therepositories = JSON.parse(response.body)
    therepotho = therepositories.max_by { |repo| repo['stargazers_count'] }
    puts "Most Starred Repo: #{therepotho['name']}  - Stars: #{therepotho['stargazers_count']} - Description #{therepotho['description']}- URL: #{therepotho['html_url']}"
else
  puts "Error: #{response.code}"
end 