class HomeController < ApplicationController
  def index
    return render :action => "before_login" unless logged_in?

    current_user
    render :action => "index"
  end
end
