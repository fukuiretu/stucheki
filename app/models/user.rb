# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  provider    :string(255)
#  uid         :string(255)
#  screen_name :string(255)
#  screen_url  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class User < ActiveRecord::Base
  has_many :cheki_events
  has_many :events, through: :cheki_events

  def self.find_or_create_from_auth(auth)
    provider = auth['provider']
    uid = auth['uid']
    screen_name = auth['info']['nickname']
    screen_url = auth['info']['image']

    User.find_or_create_by(provider: 'provider', uid: uid) do |user|
      user.screen_name = screen_name
      user.screen_url = screen_url
    end
  end
end
