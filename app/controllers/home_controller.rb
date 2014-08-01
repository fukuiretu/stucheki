class HomeController < ApplicationController
  def index
    # render :action => "before_login"
    if logged_in?
      render :action => "index"
    else
      render :action => "before_login"
    end
  end
end
