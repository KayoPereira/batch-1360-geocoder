class FlightsController < ApplicationController
  before_action :set_flight, only: %i[show destroy]

  def index
    @flights = Flight.all
  end

  def show
  end

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)
    if @flight.save
      redirect_to flights_path
    else
      render :new
    end
  end

  def destroy
    if @flight.destroy
      redirect_to flights_path
    else
      flash[:error] = "Erro ao remover o vôo."
    end
  end

  private

  def set_flight
    @flight = Flight.find(params[:id])
  end

  def flight_params
    params.require(:flight).permit(:departure, :arrival, :vacancy, :aircraft, :day_and_hour)
  end
end
