class ServersController < ApplicationController
  def rockwell
    @servers = Server.all
  end
end
