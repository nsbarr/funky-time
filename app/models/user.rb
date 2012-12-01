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
  VALID_PHONE_REGEX = /^[+#*\(\)\[\]]*([0-9][ ext+-pw#*\(\)\[\]]*){10,45}$/
  validates :prompt, presence: true, length: {maximum:40}
  validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :bid, length: {maximum:450}
end
