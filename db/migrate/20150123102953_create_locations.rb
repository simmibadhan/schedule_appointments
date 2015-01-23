class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    	t.string :address_line_1
    	t.string :address_line_2
    	t.string :country
    	t.string :state
    	t.string :city
    	t.string :zipcode
      t.timestamps
    end
  end
end
