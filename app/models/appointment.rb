class Appointment < ActiveRecord::Base
	belongs_to :schedule
	belongs_to :slot
	belongs_to :user_account
end
