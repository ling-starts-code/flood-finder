require "rails_helper"

RSpec.describe WeatherObservation, type: :model do
  context "with valid data" do
    it "creates a valid record and saves it to the database" do
      weather_observation = WeatherObservation.new(location: "somewhere", temperature: "29°", wind_speed: "49 km/h", wind_direction:"West", rainfall:"0.0mm", humidity:"68%", pressure: "1010pa")
      expect(weather_observation).to be_valid
      expect(weather_observation.location).to be_a(String)
      expect(weather_observation.temperature).to be_a(Numeric)
      expect { weather_observation.save! }.to change { WeatherObservation.count }.by(1)
    end
  end
# catch the error, invalidation to generate error 
  context "with invalid data" do
    it "will generate a validation error" do
    weather_observation = WeatherObservation.new(location: "", temperature: "29°", wind_speed: "49 km/h", wind_direction:"West", rainfall:"0.0mm", humidity:"68%", pressure: "1010pa")
    #byebug
    expect(weather_observation).not_to be_valid
    expect { weather_observation.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end

end
