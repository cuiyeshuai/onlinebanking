class BankAccount < ApplicationRecord
    belongs_to :user

    before_create do
      self.account_id = [10000000, (self.class.maximum(:account_id) || 0) + 1].max if self.account_id.nil?
    end

    self.primary_key = 'account_id'

    def transactions
      Transaction.where(["remitter_account = ? or recipient_account = ?",self.id,self.id])
    end

end
