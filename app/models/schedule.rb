class Schedule < ActiveRecord::Base
	has_many :appointments
	has_many :schedule_exceptions

	belongs_to :user_account_location
end
