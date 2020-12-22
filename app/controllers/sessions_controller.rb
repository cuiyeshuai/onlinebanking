class SessionsController < ApplicationController
  def login
  end

  def verification
    @user = User.find_by(username: params[:username].downcase)
    if @user && @user.authenticate(params[:password])
       log_in(@user)

       redirect_to '/dashboard', notice: "You have logged in successfully!"
    else
       flash.now[:alert] = "Invalid username or password! Please try again..."
       render 'login'
    end
  end

  def success
  end

  def destroy
    log_out
    # Redirect to landing page
    redirect_to '/login', notice: "You have logged out successfully!"
  end

end
