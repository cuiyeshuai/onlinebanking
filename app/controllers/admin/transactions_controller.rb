class Admin::TransactionsController < Admin::AdminController
  include Admin::TransactionsHelper

  def index
    @transactions = Transaction.all
  end

  def show
    
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
  end

  def update
  end

  def delete
  end

  def destroy
  end
end
