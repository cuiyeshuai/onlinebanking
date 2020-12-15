class Admin::TransactionsController < Admin::AdminController
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
    @transaction = Transaction.new(params.require(:transaction).permit(:amount, :recipient_name, :recipient, :reference))
    @transaction.date = DateTime.current()
    @transaction.updated_at = @transaction.created_at = Time.now()
    @transaction.currency = params[:currency]
    if @transaction.save
      redirect_to(admin_transactions_path)
    else
      render('new')
    end
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
