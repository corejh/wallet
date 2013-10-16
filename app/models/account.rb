class Account < ActiveRecord::Base

  belongs_to :user
  has_many :withdrawls, class_name: "Transaction", foreign_key: :destination_account_id
  has_many :deposits, class_name: "Transaction", foreign_key: :source_account_id

  def Account.account_types 
    { "Checking" => 1, "Saving" => 2 }
  end

  def transactions
    (withdrawls + deposits).sort_by { |obj| obj.created_at }
  end
end
