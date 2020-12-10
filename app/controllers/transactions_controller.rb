class TransactionsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new
    @transaction.date = DateTime.now
    @transaction.currency = params[:transaction][:currency]
    @transaction.amount = params[:transaction][:amount]
    @transaction.recipient_name = params[:transaction][:recipient_name]
    @transaction.recipient = params[:transaction][:recipient]
    @transaction.reference = params[:transaction][:reference]
    @transaction.bank_account_id = params[:id]
    unless @transaction.save 
      render 'new'
    end
  end

  private
    def transaction_params
      params.require(:transaction).permit(:currency, :amount,:recipient,:recipient_name)
    end
  
end
