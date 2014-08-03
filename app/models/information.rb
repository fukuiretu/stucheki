# == Schema Information
#
# Table name: information
#
#  id         :integer          not null, primary key
#  message    :string(255)
#  disp_flag  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Information < ActiveRecord::Base
end
