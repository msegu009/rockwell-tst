class LandingController < ApplicationController
  def index
  	# @club_images = Club.order("RANDOM()").limit(5).pluck(:photo)
  end
end
