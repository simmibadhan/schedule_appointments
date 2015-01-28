class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
    	t.integer :start_time
      t.timestamps
    end
  end
end
