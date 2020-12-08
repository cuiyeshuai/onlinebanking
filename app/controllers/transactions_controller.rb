class TransactionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    unless @transaction.save 
      render 'new'
    end
  end

  private
    def transaction_params
      params.require(:transaction).permit(:currency, :amount,:recipient,:recipient_name,:bank_account_id)
    end
  
end
