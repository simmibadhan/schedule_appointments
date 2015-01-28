class UserAccount < ActiveRecord::Base
	belongs_to :user
	belongs_to :account

	has_many :user_account_locations
	has_many :appointments
	has_many :appointment_as
end
