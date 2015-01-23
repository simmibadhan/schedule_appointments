class CreateScheduleExceptions < ActiveRecord::Migration
  def change
    create_table :schedule_exceptions do |t|
    	t.integer :schedule_id
    	t.datetime :date
    	t.integer :slot_id
    	t.string :status
      t.timestamps
    end
  end
end
