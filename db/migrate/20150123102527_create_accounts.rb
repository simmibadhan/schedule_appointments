class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
    	t.string :category
    	t.string :account_type
      t.timestamps
    end
  end
end
