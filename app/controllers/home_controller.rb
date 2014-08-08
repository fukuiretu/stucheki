class HomeController < ApplicationController
  def index
    if logged_in?
      render :action => "index"
    else
      render :action => "before_login"
    end
  end
end
