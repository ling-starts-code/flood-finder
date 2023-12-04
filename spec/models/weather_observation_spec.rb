require "rails_helper"

RSpec.describe WeatherObservation, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context "with some data" do
    it "creates a valid record" do
      weather_observation = WeatherObservation.new(location: "somewhere", temperature: "29")
      expect(weather_observation).to be_valid
    end
  end
end
