class CreateAirlineTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :airline_tickets do |t|
      t.float :price
      t.integer :discount
      t.string :origin

      t.timestamps
    end
  end
end
