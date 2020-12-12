class BankAccountsController < ApplicationController

  def index
    @bankAccounts = BankAccount.where(user_id: session[:user_id])
  end

  def show
    @bankAccount = BankAccount.find(params[:id])
    set_account(@bankAccount)
    count_balance(@bankAccount)# Should be removed, for testing
    @transactions = @bankAccount.transactions
  end


  private 
  # Updates the bank acount balance *should be moved to transactions,
  # should be updated after new transaction is made)
  def count_balance(bankAccount)
    sum = 0
    transactions = bankAccount.transactions
    transactions.each do |t|
      sum+= t.amount
    end 
    bankAccount.amount = sum
    bankAccount.save
  end
end
