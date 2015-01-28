class ScheduleException < ActiveRecord::Base
	belongs_to :schedule
	belongs_to :slot
end
