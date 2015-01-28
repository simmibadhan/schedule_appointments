class UserAccount < ActiveRecord::Base
	belongs_to :user
	belongs_to :account

	has_many :user_account_locations
end
