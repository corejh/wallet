class Transaction < ActiveRecord::Base
  
  belongs_to :user
  has_one :source_account
  has_one :destination_account
  
end
