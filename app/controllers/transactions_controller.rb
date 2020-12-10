class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.order('date DESC')
  end
  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    params.require(:transaction).permit(:amount, :recipient_name, :recipient, :reference)
    @transaction = Transaction.new(params[:transaction])
    @transaction.currency = params[:currency]
    @transaction.date = DateTime.current()
    @transaction.updated_at = @transaction.created_at = Time.now()
    if @transaction.save 
      redirect_to(transactions_path)
    else 
      render('new')
    end
  end

  
end
