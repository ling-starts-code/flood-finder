require 'nokogiri'
require 'open-uri'
require 'byebug'

namespace :scrape do
  THREE_HOURLY_OBSERVATION_URL = "https://www.metservice.com/publicData/webdata/maps-radar/3-hourly-observations"
  KNOWN_LOCATIONS = [
    "Wellington",
    "Castlepoint",
    "Levin",
    "Mana Island"
  ]

  desc 'Scrape weather data from metservice.com and save to database'
  task weather: :environment do
    puts "starting the scripts"
    doc = Nokogiri::HTML(URI.open(THREE_HOURLY_OBSERVATION_URL))

    locations = doc.css('div').map do |div_element|
      location = div_element.text.strip
      next unless KNOWN_LOCATIONS.any?{ |known_location| location.include?(known_location) }
      temperature = location[/Temperature:\s(-?\d+)°/, 1]
      wind_speed = location[/Wind Speed:\s(\d+)km\/h/, 1]
      wind_direction = location[/WInd Direction:\s([A-Za-z\s]+)/, 1]
      rainfall = location[/Rainfall \(last hour\):\s([\d.]+)mm/, 1]
      humidity = location[/Humidity:\s(\d+)%/, 1]
      pressure = location[/Pressure:\s(\d+)hPa/, 1]
      byebug
    end.compact

    locations.each{ |location| puts location }

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
