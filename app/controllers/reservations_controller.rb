class ReservationsController < ApplicationController
  before_action :set_club, only: [:index, :tables]

  def index
    @booking = Booking.new
    @tables2 = @club.tables
    @tables = @club.floors.map { |f| f.tables.all }.flatten
    if params[:day]
      @tables.reject! { |t| t.bookings.where(day: params[:day]).count > 0 }
    end
    @tables.reject! { |t| t.id == 13 }
  end

  def tables
    @tables = @club.floors.map { |f| f.tables.all }.flatten
    if params[:day]
      @tables.reject! { |t| t.bookings.where(day: params[:day]).count > 0 }
    end
    @tables.reject! { |t| t.id == 13 }

    render :json => @tables
  end

  private

  def set_club
    @club = Club.find_by(name: params[:clubname].capitalize)
  end
end
