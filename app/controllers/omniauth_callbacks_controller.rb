class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def instagram
    @user = User.find_or_create_by_instagram_omniauth(request.env["omniauth.auth"])
  end
end
