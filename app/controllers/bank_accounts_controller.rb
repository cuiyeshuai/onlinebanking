class BankAccountsController < ApplicationController
  def index
  end

  def show
    @bankAccount = BankAccount.find(params[:id])
    @transactions = Transaction.where(bank_account_id: params[:id])
  end

end
