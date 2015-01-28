class UserAccountLocation < ActiveRecord::Base
	belongs_to :user_account
	belongs_to :location
end
