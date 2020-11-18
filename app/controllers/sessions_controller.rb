class SessionsController < ApplicationController
  def login
  end

  def verification
    @user = User.find_by(username: params[:username])
    if @user && @user.password == params[:password]
       session[:user_id] = @user.id

       redirect_to '/success'
    else
       redirect_to '/login'
    end
  end

  def success
  end
end
