class Transaction < ActiveRecord::Base
  
  before_save :update_balance
  
  validate :insufficient_funds
  
  belongs_to :user
  belongs_to :source_account, class_name: "Account"
  belongs_to :destination_account, class_name: "Account"
  
  def Transaction.transaction_types
    { "Withdrawl" => 1, "Deposit" => 2, "Transfer" => 3 }
  end
  
  def update_balance    
    if self.source_account
      self.source_account.update_attribute(:balance, self.source_account.balance - self.amount)
      self.source_balance = self.source_account.balance    
    end
    
    if self.destination_account
      self.destination_account.update_attribute(:balance, self.destination_account.balance + self.amount)
      self.destination_balance = self.destination_account.balance
    end
  end
  
  private
  
  def insufficient_funds
    if transaction_type == 1 or (transaction_type == 3 and source_account.id == current_user.id)
      errors.add(:balance, " - Insufficient funds") if amount > source_account.balance
    end
  end
  
end
