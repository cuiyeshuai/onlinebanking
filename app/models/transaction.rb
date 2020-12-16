class Transaction < ApplicationRecord
  validate :amount_should_be_less_than_or_equal_to_remitter_balance, on: :create
  before_create do
    remitter = BankAccount.find(self.remitter_account)
    if !remitter.nil?
      remitter.amount -= self.amount
      remitter.save
    end

    recipient = BankAccount.find(self.recipient_account)
    if !recipient.nil?
      recipient.amount += self.amount
      recipient.save
    end
  end


  before_destroy do
    remitter = BankAccount.find(self.remitter_account)
    if !remitter.nil?
      remitter.amount += self.amount
      remitter.save
    end

    recipient = BankAccount.find(self.recipient_account)
    if !recipient.nil?
      recipient.amount -= self.amount
      recipient.save
    end
  end

  private 

    def amount_should_be_less_than_or_equal_to_remitter_balance
      amount = self.amount
      remitter = BankAccount.find(self.remitter_account)
      if !remitter.nil?
        if (amount > remitter.amount)
          errors.add(:amount, "can't exceed the remitter's balance")
        end
      end
    end


end
