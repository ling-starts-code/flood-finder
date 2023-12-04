class CreateWeatherObservations < ActiveRecord::Migration[7.0]
  def change
    create_table :weather_observations do |t|
      t.string :location
      t.integer :temperature
      t.integer :wind_speed
      t.string :wind_direction
      t.float :rainfall
      t.integer :humidity
      t.integer :pressure

      t.timestamps
    end
  end
end
