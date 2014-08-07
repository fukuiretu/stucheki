class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :get_current_user

  def get_current_user
    if logged_in?
      user_id = session[:user_id]
      @current_user = Rails.cache.fetch(user_id, expires_in: 1.hour) do
        User.find(user_id)
      end
    end
  end

  helper_method :logged_in?

  private

  def logged_in?
    !!session[:user_id]
  end
end
