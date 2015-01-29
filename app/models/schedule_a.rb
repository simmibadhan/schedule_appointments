class ScheduleA < ActiveRecord::Base
	belongs_to :user_account_location

	has_many :appointment_as
	has_many :events

	def unavailable_events
		self.events.where(:event_type=>"UNAVAILABLE")
	end
end
