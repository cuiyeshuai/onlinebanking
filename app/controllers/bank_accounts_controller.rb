class BankAccountsController < UserController
  include SessionsHelper
  def index
    @user = current_user
    @bankAccounts = BankAccount.where(user_id: session[:user_id])
  end

  def show

    @bankAccount = BankAccount.find(params[:id])
    # Save chosen bank account
    set_account(@bankAccount)

    @transactions = @bankAccount.transactions
  end


end
