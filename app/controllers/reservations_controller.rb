class ReservationsController < ApplicationController
  before_action :set_club, only: [:index]

  def index
    @tables = Table.all
    # render 'index0'
  end

  private

  def set_club
    @club = Club.where(id: params[:id])
  end
end
