class UserAccountLocation < ActiveRecord::Base
	belongs_to :user_account
	belongs_to :location

	has_many :schedule_as
end
