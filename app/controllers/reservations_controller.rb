class ReservationsController < ApplicationController
  before_action :set_club, only: [:index]

  def index
    @booking = Booking.new
    @tables = @club.floors.map { |f| f.tables.all }.flatten
    if params[:day]
      @tables.reject! { |t| t.bookings.where(day: params[:day]).count > 0 }
    end
  end

  private

  def set_club
    @club = Club.find_by(name: params[:clubname].capitalize)
  end
end
