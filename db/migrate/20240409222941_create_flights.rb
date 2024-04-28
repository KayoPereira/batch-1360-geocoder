class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :departure
      t.string :arrival
      t.integer :vacancy
      t.string :aircraft
      t.datetime :day_and_hour

      t.timestamps
    end
  end
end
