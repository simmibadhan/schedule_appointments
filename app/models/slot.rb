class Slot < ActiveRecord::Base
	has_many :schedule_exceptions
end
