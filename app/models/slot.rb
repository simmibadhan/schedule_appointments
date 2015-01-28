class Slot < ActiveRecord::Base
	has_many :appointments
	has_many :schedule_exceptions
end
