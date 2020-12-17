class LPageController < UserController
  include SessionsHelper

  def index
    #To do Show all bank accounts,transaction for current user
    @bankAccounts = current_user.bank_accounts

    @transactions = []
    @bankAccounts.each do |acc|
      @transactions += acc.transactions
    end
    @transactions = @transactions.uniq
    @transactions.sort {|a,b| a.created_at <=> b.created_at}

  end



end
