class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_missions
  after_action :set_missions

  def set_missions
    @missions = Mission.all
    if user_signed_in?
      @editable_missions = Mission.where(user_id: current_user.id)
    end
  end
end
