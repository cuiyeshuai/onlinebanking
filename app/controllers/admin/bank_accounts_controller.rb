class Admin::BankAccountsController < Admin::AdminController
  def index
    @bankAccounts = BankAccount.order("bank_accounts.account_id ASC")
  end


  def show
    @bankAccount= BankAccount.find(params[:id])
    @transactions = @bankAccount.transactions
  end

  def new
    @bankAccount= BankAccount.new
  end

  def create
    @bankAccount= BankAccount.new
    @bankAccount.user_id = params[:bank_account][:user_id]
    @bankAccount.type_of_account = params[:bank_account][:type_of_account]
    @bankAccount.currency = params[:bank_account][:currency]
    @bankAccount.amount = 0
    if (@bankAccount.save)
      redirect_to admin_bank_accounts_path
    else
      err = ''
      @bankAccount.errors.messages.each do |f|
      err += String(f[0])+":"+String(f[1][0]) + "@"
      end
      flash.alert = err
      render "new"
  end

  def edit
      @bankAccount= BankAccount.find(params[:id])
  end

  def update
      @bankAccount= BankAccount.find(params[:id])
      @bankAccount.type_of_account = params[:bank_account][:type_of_account]
      @bankAccount.currency = params[:bank_account][:currency]
     if (@bankAccount.save)
      redirect_to (admin_bank_accounts_path)
    end
    puts(@bankAccount.errors.messages)
  end


  def delete
      @bankAccount= BankAccount.find(params[:id])
  end

  def destroy
      @bankAccount= BankAccount.find(params[:id])
      @bankAccount.destroy
      redirect_to(admin_bank_accounts_path)
  end




end
end
