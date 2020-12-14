class BankAccountsController < UserController

  def index
    @bankAccounts = BankAccount.where(user_id: session[:user_id])
  end

  def show
    @bankAccount = BankAccount.find(params[:id])
    # Save chosen bank account
    set_account(@bankAccount)
    # Update bank account balance
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
