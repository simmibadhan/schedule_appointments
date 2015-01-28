class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.integer :schedule_id
    	t.string :event_type
    	t.time :start_time
    	t.time :end_time
      t.timestamps
    end
  end
end
