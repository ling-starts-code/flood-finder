require 'nokogiri'
require 'open-uri'
require 'byebug'

namespace :scrape do
  THREE_HOURLY_OBSERVATION_URL = "https://www.metservice.com/publicData/webdata/maps-radar/3-hourly-observations"
  KNOWN_LOCATIONS = [
    "Wellington",
    "Castlepoint",
    "Levin",
    "Mana Island",
    "Wellington (Kelburn)",
    "Lower Hutt",
    "Paraparaumu",
    "Ngawi",
    "Masterton",
  ]

  desc 'Scrape weather data from metservice.com and save to database'
  task weather: :environment do
    puts "starting the scripts"
    doc = Nokogiri::HTML(URI.open(THREE_HOURLY_OBSERVATION_URL))

    locations = doc.css('div').map do |div_element|
      location = div_element.text.strip
      next unless KNOWN_LOCATIONS.any?{ |known_location| location.include?(known_location) }
      model = WeatherObservation.new
      model.location = location.split(' ').first
      model.temperature = location[/Temperature:\s(-?\d+)°/, 1]
      model.wind_speed = location[/Wind Speed:\s(\d+)km\/h/, 1]
      model.wind_direction = location[/WInd Direction:\s([A-Za-z\s]+)/, 1]
      model.rainfall = location[/Rainfall \(last hour\):\s([\d.]+)mm/, 1]
      model.humidity = location[/Humidity:\s(\d+)%/, 1]
      model.pressure = location[/Pressure:\s(\d+)hPa/, 1]
      model.save
      #byebug
    end.compact
    byebug
    locations.each{ |location| puts location }
  end
end
