class HomeController < ApplicationController
  def index
    if logged_in?
      current_user
      render :action => "index"
    else
      render :action => "before_login"
    end
  end
end
