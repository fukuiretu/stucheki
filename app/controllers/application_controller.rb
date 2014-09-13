class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_login, unless: :except_action?
  helper_method :logged_in?

  def check_login
    return render action: 'before_login' unless logged_in?

    current_user
  end

  def current_user
    # if @current_user.nil?
    #   user_id = session[:user_id]
    #   @current_user = Rails.cache.fetch(:current_user, expires_in: 1.hour) do
    #     User.find(user_id)
    #   end
    # end
    @current_user ||= Rails.cache.fetch(:current_user, expires_in: 1.hour) do
      User.find(user_id)
    end
  end

  private

    def logged_in?
      !!session[:user_id]
    end

    def except_action?
      self.controller_name == 'sessions'
      # self.controller_name == 'sessions' || request.path_info == root_path
    end
end
