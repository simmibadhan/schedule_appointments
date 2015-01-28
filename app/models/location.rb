class Location < ActiveRecord::Base
	has_many :user_account_locations
end
