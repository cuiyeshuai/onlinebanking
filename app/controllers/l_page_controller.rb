class LPageController < UserController

  def index
    @transactions = bankAccount.transactions.order('date DESC')
  end



end
