# == Schema Information
#
# Table name: information
#
#  id         :integer          not null, primary key
#  message    :string(255)
#  disable  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Information < ActiveRecord::Base
  scope :enable, ->{
    where(:disable => 0)
  }
end
