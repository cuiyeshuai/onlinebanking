class LPageController < ApplicationController

  def index
    @bankAccounts = BankAccount.where(user_id: session[:user_id])
  end



end
