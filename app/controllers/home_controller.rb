class HomeController < ApplicationController
  def index
    return render :action => "before_login" unless logged_in?

    current_user

    @new_events = Rails.cache.fetch(:new_events, expires_in: 5.minutes) do
      Event.all.order(:created_at => :desc).limit(6)
    end

    @tags = Rails.cache.fetch(:tags, expires_in: 5.minutes) do
      Tag.all.order(:content => :asc)
    end

    render :action => "index"
  end
end
