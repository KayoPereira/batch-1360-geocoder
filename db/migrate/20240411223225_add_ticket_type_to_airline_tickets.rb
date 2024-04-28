class AddTicketTypeToAirlineTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :airline_tickets, :ticket_type, :string
  end
end
