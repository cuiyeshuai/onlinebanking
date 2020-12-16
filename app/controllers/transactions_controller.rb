class TransactionsController < UserController
  include SessionsHelper
  include TransactionsHelper
  # Show transactions for selected bank account
  def index
    @bankAccount = BankAccount.find(session[:current_bank_account_id])
    @transactions = @bankAccount.transactions
  end

  # Show selected bank account
  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
    @bank = session[:current_bank_account_id]
    @transaction.currency = BankAccount.find(@bank).currency
  end

  def create
    @transaction = Transaction.new
    @transaction.currency = BankAccount.find(@bank).currency
    @transaction.amount = params[:transaction][:amount]
    @transaction.remitter = current_user.username
    @transaction.remitter_account = session[:current_bank_account_id]
    @transaction.recipient = params[:transaction][:recipient]
    @transaction.recipient_account = params[:transaction][:recipient_account]
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
      params.require(:transaction).permit(:currency, :amount,:recipient,:recipient_account)
    end

end
