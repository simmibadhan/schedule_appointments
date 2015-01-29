class SchedulesController < ApplicationController
	def show
		if params[:id].present?
			@schedule = Schedule.find_by_id(params[:id])
			@user = @schedule.user_account_location.user_account.user
			@monday_slots = Slot.where(id: @schedule.monday_slots) if @schedule.monday_slots
			@tuesday_slots = Slot.where(id: @schedule.tuesday_slots) if @schedule.tuesday_slots
			@wednesday_slots = Slot.where(id: @schedule.wednesday_slots) if @schedule.wednesday_slots
			@thursday_slots = Slot.where(id: @schedule.thursday_slots) if @schedule.thursday_slots
			@friday_slots = Slot.where(id: @schedule.friday_slots) if @schedule.friday_slots
			@saturday_slots = Slot.where(id: @schedule.saturday_slots) if @schedule.saturday_slots
			@sunday_slots = Slot.where(id: @schedule.sunday_slots) if @schedule.sunday_slots
		end
	end
end
