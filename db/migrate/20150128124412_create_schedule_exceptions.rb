class CreateScheduleExceptions < ActiveRecord::Migration
  def change
    create_table :schedule_exceptions do |t|
    	t.integer :schedule_id
    	t.date :exception_date
    	t.integer :slot_id
    	t.string :exception_type
      t.timestamps
    end
  end
end
