class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      
      t.belongs_to :user, :null => false
      t.integer :source_account_id
      t.integer :destination_account_id
      t.integer :transaction_type, :null => false

      t.decimal :destination_balance, :default => 0
      t.decimal :source_balance, :default => 0
      t.decimal :amount, :null => false, :default => 0
      
      t.timestamps
    end
  end
end
