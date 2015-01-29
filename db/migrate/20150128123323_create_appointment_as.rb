class CreateAppointmentAs < ActiveRecord::Migration
  def change
    create_table :appointment_as do |t|
    	t.integer :schedule_a_id
    	t.string :status
    	t.time :start_time
    	t.time :end_time
      t.timestamps
    end
  end
end
