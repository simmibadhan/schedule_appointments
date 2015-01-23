class CreateUserAccountLocations < ActiveRecord::Migration
  def change
    create_table :user_account_locations do |t|
    	t.integer :user_account_id
    	t.integer :location_id
    	t.integer :max_patients_in_one_slot
      t.timestamps
    end
  end
end
