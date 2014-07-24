class HomeController < ApplicationController
  def index
    # render :action => "before_login"
    render :action => "index"
  end
  def before_login
  end
end
