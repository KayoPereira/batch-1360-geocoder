class AddFlightReferencesToAirlineTickets < ActiveRecord::Migration[7.0]
  def change
    add_reference :airline_tickets, :flight, null: false, foreign_key: true
  end
end
