# == Schema Information
#
# Table name: appointments
#
#  id                     :integer          not null, primary key
#  coach_id               :integer
#  availability_block_id  :integer
#  date                   :date
#  client_name            :string
#  created_at             :datetime
#  updated_at             :datetime


class Appointment < ApplicationRecord
	belongs_to :coach
	belongs_to :availability_block

	validates :availability_block_id, uniqueness: { scope: [:coach_id, :date] }
	validates :client_name, presence: true, length: { maximum: 255 }

end
