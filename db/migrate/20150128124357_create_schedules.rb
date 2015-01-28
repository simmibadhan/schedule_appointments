class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
    	t.integer :user_account_location_id
    	t.integer :monday_slots, :array => true
    	t.integer :tuesday_slots, :array => true
    	t.integer :wednesday_slots, :array => true
    	t.integer :thursday_slots, :array => true
    	t.integer :friday_slots, :array => true
    	t.integer :saturday_slots, :array => true
    	t.integer :sunday_slots, :array => true
      t.timestamps
    end
  end
end
