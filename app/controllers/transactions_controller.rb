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

  
end
