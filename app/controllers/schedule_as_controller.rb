class ScheduleAsController < ApplicationController
	def show
		if params[:id].present?
			@schedule = ScheduleA.find_by_id(params[:id])
			@user = @schedule.user_account_location.user_account.user
		end
	end

	def this_weeks_schedule
		date = Date.today.beginning_of_week
		@days_of_the_week = (date..date + 6.days).to_a
		@schedule = ScheduleA.find_by_id(params[:id])
		@user = @schedule.user_account_location.user_account.user
	end
end
