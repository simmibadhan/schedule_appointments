class CreateAppointmentAs < ActiveRecord::Migration
  def change
    create_table :appointment_as do |t|
    	t.integer :schedule_a_id
    	t.string :status
    	t.datetime :start_time
    	t.datetime :end_time
      t.timestamps
    end
  end
end
