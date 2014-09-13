class HomeController < ApplicationController
  def index
    @infos = Rails.cache.fetch(:infos, expires_in: 5.minutes) do
      Information.enable.order(id: :desc)
    end

    @new_events = Rails.cache.fetch(:new_events, expires_in: 5.minutes) do
      Event.all.order(created_at: :desc).limit(6)
    end

    @tags = Rails.cache.fetch(:tags, expires_in: 5.minutes) do
      Tag.all.order(content: :asc)
    end
  end
end
