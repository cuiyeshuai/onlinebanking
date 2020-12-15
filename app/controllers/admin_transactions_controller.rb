class AdminTransactionsController < ApplicationController

  def index
    @admintransactions = Transaction.all
  end

  def show
    @admintransaction = Transaction.find(params[:id])
  end

  def new
    @admintransaction = Transaction.new
  end

  def create
    @admintransaction = Transaction.new(params.require(:transaction).permit(:amount, :recipient_name, :recipient, :reference))
    @admintransaction.date = DateTime.current()
    @admintransaction.updated_at = @admintransaction.created_at = Time.now()
    @admintransaction.currency = params[:currency]
    if @admintransaction.save
      redirect_to(admintransaction_path)
    else
      render('new')
    end
  end

  def edit
    @admintransaction = Transaction.find(params[:id])
  end

  def update
    @admintransaction = Transaction.find(params[:id])
    if @admintransaction.update
      redirect_to(admintransaction_path(@admintransaction))
    else
      render('edit')
    end
  end

  def delete
    @admintransaction = Transaction.find(params[:id])
  end

  def destroy
    @admintransaction = Transaction.find(params[:id])
    if @admintransaction.destroy
      redirect_to(admintransaction_path)
    else
      render('delete')
    end
  end



end
