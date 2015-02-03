class ScheduleA < ActiveRecord::Base
	belongs_to :user_account_location

	has_many :appointment_as
	has_many :events

	def unavailable_shifts
		self.events.where(:event_type=>"UNAVAILABLE_SHIFT")
	end

	def unavailable_events_on(date)
		self.events.where("event_type='UNAVAILABLE_EVENT' and date(start_time) = '" + date.to_s + "'")
	end

	def is_available_on(date)
		day = date.strftime("%A").downcase
		case day
		when "monday"
			return true if (self.monday_start_time.present? and self.monday_end_time.present?)
		when "tuesday"
			return true if (self.tuesday_start_time.present? and self.tuesday_end_time.present?)
		when "wednesday"
			return true if (self.wednesday_start_time.present? and self.wednesday_end_time.present?)
		when "thursday"
			return true if (self.thursday_start_time.present? and self.thursday_end_time.present?)
		when "friday"
			return true if (self.friday_start_time.present? and self.friday_end_time.present?)
		when "saturday"
			return true if (self.saturday_start_time.present? and self.saturday_end_time.present?)
		when "sunday"
			return true if (self.sunday_start_time.present? and self.sunday_end_time.present?)
		else
			return false
		end
	end

	def schedule_on(date)
		day = date.strftime("%A").downcase
		case day
		when "monday"
			if (self.monday_start_time.present? and self.monday_end_time.present?)
				schedule = self.monday_start_time.strftime("%H:%M")
				if self.unavailable_shifts.present?
					self.unavailable_shifts.each do |event|
		      	if event.monday_start_time and event.monday_end_time
							schedule = schedule + " - " + event.monday_start_time.strftime("%H:%M") + ", " + event.monday_end_time.strftime("%H:%M")
						end
					end
				end
				schedule = schedule + " - " + self.monday_end_time.strftime("%H:%M")
				return schedule
			end
		when "tuesday"
			if (self.tuesday_start_time.present? and self.tuesday_end_time.present?)
				schedule = self.tuesday_start_time.strftime("%H:%M")
				if self.unavailable_shifts.present?
					self.unavailable_shifts.each do |event|
		      	if event.tuesday_start_time and event.tuesday_end_time
							schedule = schedule + " - " + event.tuesday_start_time.strftime("%H:%M") + ", " + event.tuesday_end_time.strftime("%H:%M")
						end
					end
				end
				schedule = schedule + " - " + self.tuesday_end_time.strftime("%H:%M")
				return schedule
			end
		when "wednesday"
			if (self.wednesday_start_time.present? and self.wednesday_end_time.present?)
				schedule = self.wednesday_start_time.strftime("%H:%M")
				if self.unavailable_shifts.present?
					self.unavailable_shifts.each do |event|
		      	if event.wednesday_start_time and event.wednesday_end_time
							schedule = schedule + " - " + event.wednesday_start_time.strftime("%H:%M") + ", " + event.wednesday_end_time.strftime("%H:%M")
						end
					end
				end
				schedule = schedule + " - " + self.wednesday_end_time.strftime("%H:%M")
				return schedule
			end
		when "thursday"
			if (self.thursday_start_time.present? and self.thursday_end_time.present?)
				schedule = self.thursday_start_time.strftime("%H:%M")
				if self.unavailable_shifts.present?
					self.unavailable_shifts.each do |event|
		      	if event.thursday_start_time and event.thursday_end_time
							schedule = schedule + " - " + event.thursday_start_time.strftime("%H:%M") + ", " + event.thursday_end_time.strftime("%H:%M")
						end
					end
				end
				schedule = schedule + " - " + self.thursday_end_time.strftime("%H:%M")
				return schedule
			end
		when "friday"
			if (self.friday_start_time.present? and self.friday_end_time.present?)
				schedule = self.friday_start_time.strftime("%H:%M")
				if self.unavailable_shifts.present?
					self.unavailable_shifts.each do |event|
		      	if event.friday_start_time and event.friday_end_time
							schedule = schedule + " - " + event.friday_start_time.strftime("%H:%M") + ", " + event.friday_end_time.strftime("%H:%M")
						end
					end
				end
				schedule = schedule + " - " + self.friday_end_time.strftime("%H:%M")
				return schedule
			end
		when "saturday"
			if (self.saturday_start_time.present? and self.saturday_end_time.present?)
				schedule = self.saturday_start_time.strftime("%H:%M")
				if self.unavailable_shifts.present?
					self.unavailable_shifts.each do |event|
		      	if event.saturday_start_time and event.saturday_end_time
							schedule = schedule + " - " + event.saturday_start_time.strftime("%H:%M") + ", " + event.saturday_end_time.strftime("%H:%M")
						end
					end
				end
				schedule = schedule + " - " + self.saturday_end_time.strftime("%H:%M")
				return schedule
			end
		when "sunday"
			if (self.sunday_start_time.present? and self.sunday_end_time.present?)
				schedule = self.sunday_start_time.strftime("%H:%M")
				if self.unavailable_shifts.present?
					self.unavailable_shifts.each do |event|
		      	if event.sunday_start_time and event.sunday_end_time
							schedule = schedule + " - " + event.sunday_start_time.strftime("%H:%M") + ", " + event.sunday_end_time.strftime("%H:%M")
						end
					end
				end
				schedule = schedule + " - " + self.sunday_end_time.strftime("%H:%M")
				return schedule
			end
		else
			return false
		end
	end

	def available_slots_on(date)
		day = date.strftime("%A").downcase
		slots = Slot.all
		available_slots = []
		unavailable_slots = []
		case day
		when "monday"
			if (self.monday_start_time.present? and self.monday_end_time.present?)
				start_time = self.monday_start_time.strftime("%H:%M")
				end_time = self.monday_end_time.strftime("%H:%M")
				slots.each do |slot|
					slot_time = slot.start_time.strftime("%H:%M")
					if (slot_time >= start_time and slot_time < end_time)
						available_slots << slot_time
					end
				end
			end
			if self.unavailable_shifts.present?
				self.unavailable_shifts.each do |event|
					if event.monday_start_time and event.monday_end_time
						start_time = event.monday_start_time.strftime("%H:%M")
						end_time = event.monday_end_time.strftime("%H:%M")
						slots.each do |slot|
							slot_time = slot.start_time.strftime("%H:%M")
							if (slot_time >= start_time and slot_time < end_time)
								unavailable_slots << slot_time
							end		
						end
					end
				end
			end
			if self.unavailable_events_on(date).present?
				self.unavailable_events_on(date).each do |event|
					start_time = event.start_time.strftime("%H:%M")
					end_time = event.end_time.strftime("%H:%M")
					slots.each do |slot|
						slot_time = slot.start_time.strftime("%H:%M")
						if (slot_time >= start_time and slot_time < end_time)
							unavailable_slots << slot_time
						end
					end
				end
			end
			return available_slots - unavailable_slots
		when "tuesday"
			if (self.tuesday_start_time.present? and self.tuesday_end_time.present?)
				start_time = self.tuesday_start_time.strftime("%H:%M")
				end_time = self.tuesday_end_time.strftime("%H:%M")
				slots.each do |slot|
					slot_time = slot.start_time.strftime("%H:%M")
					if (slot_time >= start_time and slot_time < end_time)
						available_slots << slot_time
					end
				end
			end
			if self.unavailable_shifts.present?
				self.unavailable_shifts.each do |event|
					if event.tuesday_start_time and event.tuesday_end_time
						start_time = event.tuesday_start_time.strftime("%H:%M")
						end_time = event.tuesday_end_time.strftime("%H:%M")
						slots.each do |slot|
							slot_time = slot.start_time.strftime("%H:%M")
							if (slot_time >= start_time and slot_time < end_time)
								unavailable_slots << slot_time
							end		
						end
					end
				end
			end
			if self.unavailable_events_on(date).present?
				self.unavailable_events_on(date).each do |event|
					start_time = event.start_time.strftime("%H:%M")
					end_time = event.end_time.strftime("%H:%M")
					slots.each do |slot|
						slot_time = slot.start_time.strftime("%H:%M")
						if (slot_time >= start_time and slot_time < end_time)
							unavailable_slots << slot_time
						end
					end
				end
			end
			return available_slots - unavailable_slots
		when "wednesday"
			if (self.wednesday_start_time.present? and self.wednesday_end_time.present?)
				start_time = self.wednesday_start_time.strftime("%H:%M")
				end_time = self.wednesday_end_time.strftime("%H:%M")
				slots.each do |slot|
					slot_time = slot.start_time.strftime("%H:%M")
					if (slot_time >= start_time and slot_time < end_time)
						available_slots << slot_time
					end
				end
			end
			if self.unavailable_shifts.present?
				self.unavailable_shifts.each do |event|
					if event.wednesday_start_time and event.wednesday_end_time
						start_time = event.wednesday_start_time.strftime("%H:%M")
						end_time = event.wednesday_end_time.strftime("%H:%M")
						slots.each do |slot|
							slot_time = slot.start_time.strftime("%H:%M")
							if (slot_time >= start_time and slot_time < end_time)
								unavailable_slots << slot_time
							end		
						end
					end
				end
			end
			if self.unavailable_events_on(date).present?
				self.unavailable_events_on(date).each do |event|
					start_time = event.start_time.strftime("%H:%M")
					end_time = event.end_time.strftime("%H:%M")
					slots.each do |slot|
						slot_time = slot.start_time.strftime("%H:%M")
						if (slot_time >= start_time and slot_time < end_time)
							unavailable_slots << slot_time
						end
					end
				end
			end
			return available_slots - unavailable_slots
		when "thursday"
			if (self.thursday_start_time.present? and self.thursday_end_time.present?)
				start_time = self.thursday_start_time.strftime("%H:%M")
				end_time = self.thursday_end_time.strftime("%H:%M")
				slots.each do |slot|
					slot_time = slot.start_time.strftime("%H:%M")
					if (slot_time >= start_time and slot_time < end_time)
						available_slots << slot_time
					end
				end
			end
			if self.unavailable_shifts.present?
				self.unavailable_shifts.each do |event|
					if event.thursday_start_time and event.thursday_end_time
						start_time = event.thursday_start_time.strftime("%H:%M")
						end_time = event.thursday_end_time.strftime("%H:%M")
						slots.each do |slot|
							slot_time = slot.start_time.strftime("%H:%M")
							if (slot_time >= start_time and slot_time < end_time)
								unavailable_slots << slot_time
							end		
						end
					end
				end
			end
			if self.unavailable_events_on(date).present?
				self.unavailable_events_on(date).each do |event|
					start_time = event.start_time.strftime("%H:%M")
					end_time = event.end_time.strftime("%H:%M")
					slots.each do |slot|
						slot_time = slot.start_time.strftime("%H:%M")
						if (slot_time >= start_time and slot_time < end_time)
							unavailable_slots << slot_time
						end
					end
				end
			end
			return available_slots - unavailable_slots
		when "friday"
			if (self.friday_start_time.present? and self.friday_end_time.present?)
				start_time = self.friday_start_time.strftime("%H:%M")
				end_time = self.friday_end_time.strftime("%H:%M")
				slots.each do |slot|
					slot_time = slot.start_time.strftime("%H:%M")
					if (slot_time >= start_time and slot_time < end_time)
						available_slots << slot_time
					end
				end
			end
			if self.unavailable_shifts.present?
				self.unavailable_shifts.each do |event|
					if event.friday_start_time and event.friday_end_time
						start_time = event.friday_start_time.strftime("%H:%M")
						end_time = event.friday_end_time.strftime("%H:%M")
						slots.each do |slot|
							slot_time = slot.start_time.strftime("%H:%M")
							if (slot_time >= start_time and slot_time < end_time)
								unavailable_slots << slot_time
							end		
						end
					end
				end
			end
			if self.unavailable_events_on(date).present?
				self.unavailable_events_on(date).each do |event|
					start_time = event.start_time.strftime("%H:%M")
					end_time = event.end_time.strftime("%H:%M")
					slots.each do |slot|
						slot_time = slot.start_time.strftime("%H:%M")
						if (slot_time >= start_time and slot_time < end_time)
							unavailable_slots << slot_time
						end
					end
				end
			end
			return available_slots - unavailable_slots
		when "saturday"
			if (self.saturday_start_time.present? and self.saturday_end_time.present?)
				start_time = self.saturday_start_time.strftime("%H:%M")
				end_time = self.saturday_end_time.strftime("%H:%M")
				slots.each do |slot|
					slot_time = slot.start_time.strftime("%H:%M")
					if (slot_time >= start_time and slot_time < end_time)
						available_slots << slot_time
					end
				end
			end
			if self.unavailable_shifts.present?
				self.unavailable_shifts.each do |event|
					if event.saturday_start_time and event.saturday_end_time
						start_time = event.saturday_start_time.strftime("%H:%M")
						end_time = event.saturday_end_time.strftime("%H:%M")
						slots.each do |slot|
							slot_time = slot.start_time.strftime("%H:%M")
							if (slot_time >= start_time and slot_time < end_time)
								unavailable_slots << slot_time
							end		
						end
					end
				end
			end
			if self.unavailable_events_on(date).present?
				self.unavailable_events_on(date).each do |event|
					start_time = event.start_time.strftime("%H:%M")
					end_time = event.end_time.strftime("%H:%M")
					slots.each do |slot|
						slot_time = slot.start_time.strftime("%H:%M")
						if (slot_time >= start_time and slot_time < end_time)
							unavailable_slots << slot_time
						end
					end
				end
			end
			return available_slots - unavailable_slots
		when "sunday"
			if (self.sunday_start_time.present? and self.sunday_end_time.present?)
				start_time = self.sunday_start_time.strftime("%H:%M")
				end_time = self.sunday_end_time.strftime("%H:%M")
				slots.each do |slot|
					slot_time = slot.start_time.strftime("%H:%M")
					if (slot_time >= start_time and slot_time < end_time)
						available_slots << slot_time
					end
				end
			end
			if self.unavailable_shifts.present?
				self.unavailable_shifts.each do |event|
					if event.sunday_start_time and event.sunday_end_time
						start_time = event.sunday_start_time.strftime("%H:%M")
						end_time = event.sunday_end_time.strftime("%H:%M")
						slots.each do |slot|
							slot_time = slot.start_time.strftime("%H:%M")
							if (slot_time >= start_time and slot_time < end_time)
								unavailable_slots << slot_time
							end		
						end
					end
				end
			end
			if self.unavailable_events_on(date).present?
				self.unavailable_events_on(date).each do |event|
					start_time = event.start_time.strftime("%H:%M")
					end_time = event.end_time.strftime("%H:%M")
					slots.each do |slot|
						slot_time = slot.start_time.strftime("%H:%M")
						if (slot_time >= start_time and slot_time < end_time)
							unavailable_slots << slot_time
						end
					end
				end
			end
			return available_slots - unavailable_slots
		else
			return false
		end
	end
end
