class AirlineTicketsController < ApplicationController
  before_action :set_flight, only: %i[index create new edit]
  before_action :set_airline_ticket, only: [:show]

  def index
    @airline_tickets = AirlineTicket.where(flight_id: @flight.id)
  end

  # def my_airline_tickets
  # end

  def show
  end

  def new
    @airline_ticket = AirlineTicket.new
  end

  def create
    @airline_ticket = AirlineTicket.new(airline_ticket_params)
    @airline_ticket.flight = @flight
    if @airline_ticket.save
      redirect_to flight_path(@flight)
    else
      render :new
    end
  end

  def edit
    @airline_ticket = AirlineTicket.find(params[:id])
  end

  def update
    @airline_ticket = AirlineTicket.find(params[:id])
    @airline_ticket.update(airline_ticket_params)
    redirect_to my_flights_path
  end

  def destroy
    @airline_ticket = AirlineTicket.find(params[:id])
    @airline_ticket.destroy
    redirect_to my_flights_path
  end

  private

  def airline_ticket_params
    params.require(:airline_ticket).permit(:flight_id, :price, :discount, :origin, :ticket_type)
  end

  def set_airline_ticket
    @airline_ticket = AirlineTicket.find(params[:id])
  end

  def set_flight
    @flight = Flight.find(params[:flight_id])
  end
end
