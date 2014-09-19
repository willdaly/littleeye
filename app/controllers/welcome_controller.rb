class WelcomeController < ApplicationController

  def index
    @missions = Mission.all
  end

end
