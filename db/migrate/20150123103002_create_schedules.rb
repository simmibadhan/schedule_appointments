class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
    	t.integer :user_account_location_id
    	t.hstore :schedule_details
      t.timestamps
    end
  end
end
