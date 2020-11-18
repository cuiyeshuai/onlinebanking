class BankAccount < ApplicationRecord
    has_many :transactions, :dependent => :destroy
    belongs_to :user

    self.primary_key = 'account_id'
end
