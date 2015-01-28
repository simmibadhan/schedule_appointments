class AppointmentA < ActiveRecord::Base
	belongs_to :schedule_a
	belongs_to :user_account
end
