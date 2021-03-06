class SessionsController < ApplicationController
  def callback
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    Rails.cache.write(:current_user, user, expires_in: 1.hour)
    session[:user_id] = user.id

    redirect_to '/home/show'
  end

  def destroy
    reset_session
    @current_user = nil

    redirect_to root_path
  end
end
