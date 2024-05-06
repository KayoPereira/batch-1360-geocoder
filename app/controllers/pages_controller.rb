class PagesController < ApplicationController
  def home
    if params[:origin].present?
      @flights = Flight.where('lower(departure) = ?', params[:origin].downcase)
      render :json => @flights
    else 
      @flights = Flight.all
    end
  end
end
