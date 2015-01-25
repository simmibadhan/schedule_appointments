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

end #namespace