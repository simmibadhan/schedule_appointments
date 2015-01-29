class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.integer :schedule_id
    	t.string :event_type
    	t.time :start_time
    	t.time :end_time
    	t.time :monday_start_time
    	t.time :monday_end_time
    	t.time :tuesday_start_time
    	t.time :tuesday_end_time
    	t.time :wednesday_start_time
    	t.time :wednesday_end_time
    	t.time :thursday_start_time
    	t.time :thursday_end_time
    	t.time :friday_start_time
    	t.time :friday_end_time
    	t.time :saturday_start_time
    	t.time :saturday_end_time
    	t.time :sunday_start_time
    	t.time :sunday_end_time
      t.timestamps
    end
  end
end
