class ReservationController < ApplicationController
  def index
  	@table = Table.all
  end
end
