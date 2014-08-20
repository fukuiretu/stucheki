class SessionsController < ApplicationController
  def callback
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    Rails.cache.write(:current_user, user, expires_in: 1.hour)
    session[:user_id] = user.id

    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil

    redirect_to root_path
  end
end
