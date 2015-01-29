class ScheduleAsController < ApplicationController
	def show
		if params[:id].present?
			@schedule = ScheduleA.find_by_id(params[:id])
			@user = @schedule.user_account_location.user_account.user
		end
	end
end
