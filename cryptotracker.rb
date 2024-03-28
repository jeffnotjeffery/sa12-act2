#Crypto Currency Tracker
require 'httparty'
require 'json'

response = HTTParty.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd')

if response.code == 200
    cryptocurr = JSON.parse(response.body)
    sortedcrypto = cryptocurr.sort_by { |crypto| -crypto['market_cap']}

    puts "Top 31 Cryptcurrencies listed by market capitalization: "
    sortedcrypto.take(31).each_with_index do |crypto, index|
        puts "#{index + 1}, #{crypto['name']} - Price: $#{crypto['current_price']} - Market Cap: $#{'market_cap'}"
    end
else
    puts 'Error: #{response.code}'
end