require "rails_helper"

RSpec.describe "routes", type: :routing do
  it "routes to #index" do
    expect(:get => "/weather_observations").to route_to(
      :controller => "weather_observations",
      :action => "index",
    )
  end
end
