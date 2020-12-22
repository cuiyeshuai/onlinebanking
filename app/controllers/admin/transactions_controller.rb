class Admin::TransactionsController < Admin::AdminController
  include Admin::TransactionsHelper

  def index
    @transactions = Transaction.all
  end


  def new
  end

  def create
    amount = params[:amount].to_i
    user = params[:user].to_i
    bankacc = params[:bankacc].to_i
    generate_transactions(amount, user, bankacc)
    redirect_to admin_transactions_path
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction= Transaction.find(params[:id])
      @transaction.amount = params[:transaction[:type_of_account]
      @transaction.currency = params[:transaction][:currency]
    if (@transaction.save)
      redirect_to (admin_transactions_path)
    end
    puts(@transaction.errors.messages)
  end

  def delete
    @transaction = Transaction.find(params[:id])
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
      redirect_to(admin_transactions_path)
  end
end
