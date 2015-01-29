class UserAccountLocation < ActiveRecord::Base
	belongs_to :user_account
	belongs_to :location

	has_one :schedule_a
	has_one :schedule
end
