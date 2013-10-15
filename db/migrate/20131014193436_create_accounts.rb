class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      
      t.belongs_to :user, :null => false
      t.integer :account_type, :null => false
      t.decimal :balance, :null => false, :default => 0
      
      t.timestamps
    end
  end
end
