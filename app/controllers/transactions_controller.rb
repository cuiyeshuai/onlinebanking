class TransactionsController < ApplicationController
  include BankAccountsHelper
  def index
    @transactions = Transaction.order('date DESC')
  end
  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
    @bank = session[:current_bank_account_id]
  end

  def create
    @transaction = Transaction.new
    @transaction.date = DateTime.now
    @transaction.currency = params[:transaction][:currency]
    @transaction.amount = params[:transaction][:amount]
    @transaction.recipient_name = params[:transaction][:recipient_name]
    @transaction.recipient = params[:transaction][:recipient]
    @transaction.reference = params[:transaction][:reference]
    @transaction.bank_account_id = session[:current_bank_account_id]
    if @transaction.save
      redirect_to bank_account_path(session[:current_bank_account_id])
    else
      render 'new'
  end
  
  # NEW from T9
  def create
    @transaction = Transaction.new(params.require(:transaction).permit(:amount, :recipient_name, :recipient, :reference))
    @transaction.date = DateTime.current()
    @transaction.updated_at = @transaction.created_at = Time.now()
    @transaction.currency = params[:currency]
    if @transaction.save 
      redirect_to(transactions_path)
    else 
      render('new')
    end
  end

  # Use this later
  private
    def transaction_params
      params.require(:transaction).permit(:currency, :amount,:recipient,:recipient_name)
    end

end
