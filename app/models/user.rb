# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  phone      :string(255)
#  prompt     :string(255)
#  bid        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :bid, :phone, :prompt
  
  validates :bid, presence: true
  validates :prompt, presence: true, length: {maximum:40}
  VALID_PHONE_REGEX = /^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$/
  validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }
end
