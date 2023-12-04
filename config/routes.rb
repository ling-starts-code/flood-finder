# frozen_string_literal: true

Rails.application.routes.draw do
  get "weather_observations", to: "weather_observations#index"
end
