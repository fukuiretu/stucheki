class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_login, :except => [:index, :callback, :destroy]
  helper_method :logged_in?

  def check_login
    unless logged_in?
      redirect_to root_path
    end
    
    current_user
  end

  def current_user
    @current_user =
      if @current_user.nil?
        user_id = session[:user_id]
        @current_user = Rails.cache.fetch(user_id, expires_in: 1.hour) do
          User.find(user_id)
        end
      end
  end

  private

  def logged_in?
    !!session[:user_id]
  end
end
