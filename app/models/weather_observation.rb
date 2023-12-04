class WeatherObservation < ApplicationRecord
  validates :location, presence: true
  validates :temperature, presence: true
  wellington_weather_observations = WeatherObservation.where(location: "Wellington")
end

# add test and validation
