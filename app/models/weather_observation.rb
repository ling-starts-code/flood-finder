class WeatherObservation < ApplicationRecord
  validates :location, :temperature, :wind_speed, :wind_direction, :rainfall, :humidity, :pressure, presence: true
  wellington_weather_observations = WeatherObservation.where(location: "Wellington")
end
