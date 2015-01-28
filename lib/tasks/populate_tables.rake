require 'open-uri'
namespace :db do

  desc "Populate Accounts Table"
  task :populate_accounts_table => :environment do
    puts Time.current
    puts "Rake Task Started...."
    puts "------------------------------------------------------"

    begin
      Account.destroy_all
      Account.create([
        {
          :id => 1,
          :category => "Doctor",
          :account_type => "Provider"
        },
        {
          :id => 2,
          :category => "Lab Owner",
          :account_type => "Provider"
        },
        {
          :id => 3,
          :category => "Pharmacy Owner",
          :account_type => "Provider"
        },
        {
          :id => 4,
          :category => "Patient",
          :account_type => "Patient"
        }
      ])
    rescue StandardError => e
      puts e
    end

    puts "------------------------------------------------------"
    puts "Rake Task Ended...."
    puts Time.current
  end #task

  desc "Populate User Profile Tables - users, user_accounts, locations, user_account_locations"
  task :populate_user_profile_tables => :environment do
    puts Time.current
    puts "Rake Task Started...."
    puts "------------------------------------------------------"

    begin
      puts "Email id: "
      email = STDIN.gets
      puts "Password: "
      pwd = STDIN.gets
      puts "Name: "
      name = STDIN.gets
      puts "Account Type (1 - Doctor, 4 - Patient): "
      account_type = STDIN.gets
      puts "Address Line 1: "
      addr_line_1 = STDIN.gets
      puts "Address Line 2: "
      addr_line_2 = STDIN.gets
      puts "Country: "
      country = STDIN.gets
      puts "State: "
      state = STDIN.gets
      puts "City: "
      city = STDIN.gets
      puts "Zip: "
      zip = STDIN.gets

      user = User.create(:email => email, :password => pwd, :name => name)
      user_account = UserAccount.create(:user_id => user.id, :account_id => account_type)
      location = Location.create(:address_line_1 => addr_line_1, :address_line_2 => addr_line_2, :country => country, :state => state, :city => city, :zipcode => zip)
      user_account_location = UserAccountLocation.create(:user_account_id => user_account.id, :location_id => location.id, :max_patients_in_one_slot => 6)

      puts "------------------------------------------------------"
      puts "User Data Populated"
      puts "user_id = " + user.id.to_s
      
    rescue StandardError => e
      puts e
    end

    puts "------------------------------------------------------"
    puts "Rake Task Ended...."
    puts Time.current
  end #task

end #namespace