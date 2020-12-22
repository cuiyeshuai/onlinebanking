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
    @id = params[:id]
    @user = nil
    @users = []
    if !@id.nil?
      @user = User.find(@id) rescue nil
      if !@user.nil?
        @bankAccount.user_id = @user.id
        @users = [[@user.username, @user.id]]
      else
        render :file => 'public/404.html', status => :not_found, :layout => false
      end
    else
      @users = User.select("username, id")
      @users = @users.map {|u| [u.username, u.id]}
    end

  end

  def create
    @bankAccount= BankAccount.new
    if (params[:user_id].nil?)
      @bankAccount.user_id = params[:bank_account][:user_id]
    else
      @bankAccount.user_id = params[:user_id]
    end
    @bankAccount.type_of_account = params[:bank_account][:type_of_account]
    @bankAccount.currency = params[:bank_account][:currency]
    @bankAccount.amount = 0
    if (@bankAccount.save)
      redirect_to admin_bank_accounts_path
    else
      alert = ""
      @bankAccount.errors.messages.each do |att, reason|
        alert += (String(att) + ": " + reason[0] +";")
      end
      flash.now[:alert] = alert
      new
      render "new"
    end
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
    else
      alert = ""
      @bankAccount.errors.messages.each do |att, reason|
        alert += (String(att) + ": " + reason[0] +";")
      end
      flash.now[:alert] = alert
      render 'edit'
    end

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
