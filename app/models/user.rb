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
  
  validates :prompt, presence: true, length: {maximum:40}
  validates :phone, presence: true
end
