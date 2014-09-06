# == Schema Information
#
# Table name: events
#
#  id               :integer          not null, primary key
#  service_type     :integer
#  service_event_id :integer
#  title            :string(255)
#  tag              :string(255)
#  started_at       :datetime
#  ended_at         :datetime
#  place            :string(255)
#  link             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
