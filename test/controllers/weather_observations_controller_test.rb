require "test_helper"

class WeatherObservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weather_observations_index_url
    assert_response :success
  end
end
