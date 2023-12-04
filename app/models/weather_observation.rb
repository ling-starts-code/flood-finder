class WeatherObservation < ApplicationRecord
  wellington_weather_observations = WeatherObservation.where(location: "Wellington")
end
