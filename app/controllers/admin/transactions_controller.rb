class Admin::TransactionsController < Admin::AdminController
  include Admin::TransactionsHelper

  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])

  end

  def new
    @transaction = Transaction.new
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
    @transaction = Transaction.find(params[:id])
    if @transaction.update
      redirect_to(admin_transaction_path(@transaction))
    else
      render('edit')
    end
  end

  def delete
    @transaction = Transaction.find(params[:id])
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    if @transaction.destroy
      redirect_to(admin_transactions_path)
    else
      render('delete')
    end
  end
end
