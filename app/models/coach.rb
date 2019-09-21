# == Schema Information
#
# Table name: coaches
#
#  id                     :integer          not null, primary key
#  name                   :string
#  time_zone              :string, default: "UTC"
#  created_at             :datetime
#  updated_at             :datetime

class Coach < ApplicationRecord
	has_many :availability_blocks, dependent: :destroy
	has_many :appointments, dependent: :destroy

	validates :name, presence: true, length: { maximum: 255 }
	validates :time_zone, presence: true, length: { maximum: 255 }
end
