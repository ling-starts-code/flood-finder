class WeatherObservationsController < ApplicationController
  def index
    @weather_observations = WeatherObservation.all
  end
end
