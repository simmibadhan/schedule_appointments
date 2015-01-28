class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
    	t.integer :user_account_id
    	t.integer :schedule_id
    	t.date :appointment_date
    	t.integer :slot_id
    	t.string :status
      t.timestamps
    end
  end
end
