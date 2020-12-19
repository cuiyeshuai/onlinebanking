class LPageController < UserController
  include SessionsHelper

  def index
    #To do Show all bank accounts,transaction for current user
    @user = current_user
    @last_logged_in_location = session[:last_logged_in_location]
    @bankAccounts = @user.bank_accounts

    @transactions = []
    @bankAccounts.each do |acc|
      @transactions += acc.transactions
    end
    @transactions = @transactions.uniq
    @transactions.sort {|a,b| a.created_at <=> b.created_at}

  end



end
