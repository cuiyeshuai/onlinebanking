class SessionsController < ApplicationController
  def login
  end

  def verification
    @user = User.find_by(username: params[:username].downcase)
    if @user && @user.authenticate(params[:password])
       log_in(@user)

       redirect_to '/success'
    else
       render 'login'
    end
  end

  def success
  end
  
end
