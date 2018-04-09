class ClubController < ApplicationController
  
  def index # display list of clubs
  	@club =  Club.all #this will have a view template
  end

  def show #shows one instance of club
  	@club =  Club.select(params[:id]) #this will have a view template
  end

  def new # makes a new instance of a club
  	#admid privalages
  end

  def create #saves record of new club
  	#admid privalages and will not have a view template
  end

  def edit #displays the form for an existing club
  	#admid privalages
  end

  def update #saves the form for an existing club
  	
  end

  def destroy #self explanitory
  end

end
