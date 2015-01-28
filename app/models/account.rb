class Account < ActiveRecord::Base
	has_many :user_accounts
end
