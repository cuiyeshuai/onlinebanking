class Transaction < ApplicationRecord
  validate :amount_should_be_less_than_or_equal_to_remitter_balance, on: :create
  validate :amount_should_be_positive, on: :create
  validate :remitter_and_recipient_account_currenncy_type_should_be_the_same, on: :create
  before_create do
    remitter = BankAccount.find(self.remitter_account)  rescue nil
    if !remitter.nil?
      remitter.amount -= self.amount
      remitter.save
    end

    recipient = BankAccount.find(self.recipient_account) rescue nil
    if !recipient.nil?
      recipient.amount += self.amount
      recipient.save
    end
  end


  before_destroy do
    remitter = BankAccount.find(self.remitter_account)  rescue nil
    if !remitter.nil?
      remitter.amount += self.amount
      remitter.save
    end

    recipient = BankAccount.find(self.recipient_account)  rescue nil
    if !recipient.nil?
      recipient.amount -= self.amount
      recipient.save
    end
  end

  private

    def amount_should_be_less_than_or_equal_to_remitter_balance
      amount = self.amount
      remitter = BankAccount.find(self.remitter_account)  rescue nil
      if !remitter.nil?
        if (amount > remitter.amount)
          errors.add(:amount, "can't exceed the remitter's balance")
        end
      end
    end

    def amount_should_be_positive
      amount = self.amount
      if (amount <= 0)
        errors.add(:amount, "can't be negative")
      end
    end

    def remitter_and_recipient_account_currenncy_type_should_be_the_same
      remitter= BankAccount.find(self.remitter_account)  rescue nil
      recipient = BankAccount.find(self.recipient_account)  rescue nil
      if !(remitter.nil? || recipient.nil?)
        if remitter.currency != recipient.currency
          errors.add(:currency, "can't make transactions to accounts of different currnecy")
        end
      end
    end

end
