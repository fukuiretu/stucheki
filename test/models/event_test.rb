# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  origin_type :integer
#  title       :string(255)
#  description :string(255)
#  tag         :string(255)
#  from_date   :datetime
#  to_date     :datetime
#  place       :string(255)
#  link        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
