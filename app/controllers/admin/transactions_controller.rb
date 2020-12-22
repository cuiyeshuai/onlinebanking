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
    bankacc = params[:bankacc].to_i


    alert = ""
    if amount <=0
      alert += "amount: cannot be negative!;"
    end

    @bank = BankAccount.find(bankacc) rescue nil
    if @bank.nil?
      alert += "bank account: does not exist!"
    end

    puts (alert)
    if alert == ""
      user = @bank.user_id.to_i
      generate_transactions(amount, user, bankacc)
      redirect_to '/admin/bank_accounts/'+String(bankacc)
    else

      flash[:alert] = alert
      redirect_to '/admin/transactions/'
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])
    @transaction.amount = params[:transaction][:amount]
    @transaction.remitter = params[:transaction][:remitter]
    @transaction.remitter_account = params[:transaction][:remitter_account]
    @transaction.recipient = params[:transaction][:recipient]
    @transaction.recipient_account = params[:transaction][:recipient_account]
    @transaction.reference = params[:transaction][:reference]
    if @transaction.save
      redirect_to(admin_transaction_path(@transaction))
    else

      alert = ""
      @transaction.errors.messages.each do |att, reason|
        alert += (String(att) + ": " + reason[0] +";")
      end
      flash.now[:alert] = alert
      edit
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
