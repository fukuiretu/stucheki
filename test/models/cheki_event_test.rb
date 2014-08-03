# == Schema Information
#
# Table name: cheki_events
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  event_id     :integer
#  cheki_status :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class ChekiEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
