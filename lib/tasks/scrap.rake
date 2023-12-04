require 'nokogiri'
require 'httparty'
require 'byebug'

namespace :scrape do
  desc 'Scrape weather data from metservice.com and save to database'
  task weather: :environment do
    puts "starting the scripts"

    url = 'https://www.metservice.com/maps-radar/3-hourly-observations#wellington-and-wairarapa'
    doc = Nokogiri::HTML( HTTParty.get(url))

    result = doc.css("title")
    body = doc.css("body")
    main = doc.css("main")
    byebug
  
    # response = HTTParty.get(url)

    # if response.code == 200
    #   html = Nokogiri::HTML(response.body)

    #   # # Assuming the data for Wellington and Wairarapa is in a div with class "location-data"
    #   # locations_data = html.css('div.location-data')

    #   # locations_data.each do |location_data|
    #   #   # Extract the location name from the "location" span
    #   #   location_name = location_data.css('span.location').text.strip

    #   #   # Check if the location matches Wellington or Wairarapa
    #   #   if location_name.downcase.include?('wellington') || location_name.downcase.include?('wairarapa')
    #   #     # Extract the temperature, wind speed, wind direction, rainfall, humidity, and pressure using regex
    #   #     temperature = location_data.text[/Temperature:\s(-?\d+)°/, 1]
    #   #     wind_speed = location_data.text[/Wind Speed:\s(\d+)km\/h/, 1]
    #   #     wind_direction = location_data.text[/WInd Direction:\s([A-Za-z\s]+)/, 1]
    #   #     rainfall = location_data.text[/Rainfall \(last hour\):\s([\d.]+)mm/, 1]
    #   #     humidity = location_data.text[/Humidity:\s(\d+)%/, 1]
    #   #     pressure = location_data.text[/Pressure:\s(\d+)hPa/, 1]

    #       # Create a new WeatherObservation record and save it to the database
    #       WeatherObservation.create(
    #         location: location_name,
    #         temperature: temperature,
    #         wind_speed: wind_speed,
    #         wind_direction: wind_direction,
    #         rainfall: rainfall,
    #         humidity: humidity,
    #         pressure: pressure
    #       )
    #     end
    #   end

    #   puts "Data has been saved to the database."
    # else
    #   puts "Error: Failed to fetch the URL (#{response.code})"
    # end
  end
end
