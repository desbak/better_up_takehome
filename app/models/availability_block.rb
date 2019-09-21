# == Schema Information
#
# Table name: availability_blocks
#
#  id                     :integer          not null, primary key
#  coach_id               :integer
#  day                    :string
#  start_time             :time  # in local tz of coach
#  end_time               :time  # in local tz of coach
#  created_at             :datetime
#  updated_at             :datetime

class AvailabilityBlock < ApplicationRecord
	belongs_to :coach
	has_many :appointments


	validates :day, :inclusion => { :in => %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday) }
end
