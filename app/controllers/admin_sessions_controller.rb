class AdminSessionsController < ApplicationController
  include AdminSessionsHelper
  def new

  end

  def create
    administrator = Administrator.find_by(administratorname: params[:administratorname].downcase)
    if administrator && administrator.authenticate(params[:password])
      log_in(administrator)
      render 'success'
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to admin_login_path
  end


end
