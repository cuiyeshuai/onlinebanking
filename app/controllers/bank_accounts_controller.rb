class BankAccountsController < UserController

  def index
    @bankAccounts = BankAccount.where(user_id: session[:user_id])
  end

  def show
    @bankAccount = BankAccount.find(params[:id])
    # Save chosen bank account
    set_account(@bankAccount)

    @transactions = @bankAccount.transactions
  end


end
