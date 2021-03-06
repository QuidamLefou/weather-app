require 'yahoo_weatherman'

def getlocation
	puts "Please enter your zipcode for your weather forcast"
	weather = gets.chomp
end
 
def location_lookup(location)
  client = Weatherman::Client.new
  client.lookup_by_location(location)
end

location = getlocation
weather = location_lookup(location)
today = Time.now.strftime('%w').to_i
 
weather.forecasts.each do |forecast|
 
day = forecast['date']
 
weekday = day.strftime('%w').to_i
 
if weekday == today
   dayName = 'Today'
elsif weekday == today + 1
   dayName = 'Tomorrow'
else
   dayName = day.strftime('%A')
end
 
puts dayName + ' is going to be ' + forecast['text'].downcase + ' with a low of ' + forecast['low'].to_s + ' and a high of ' + forecast['high'].to_s
 
end

puts "thank you for using the weather app!"


