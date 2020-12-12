class TransactionsController < ApplicationController
  include BankAccountsHelper
  def index
  end

  def show
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
  end

  # Use this later
  private
    def transaction_params
      params.require(:transaction).permit(:currency, :amount,:recipient,:recipient_name)
    end

end
