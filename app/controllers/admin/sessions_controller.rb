class Admin::SessionsController < ApplicationController
  include Admin::SessionsHelper
  def new

  end

  def create
    administrator = Administrator.find_by(administratorname: params[:administratorname].downcase)
    if administrator && administrator.authenticate(params[:password])
      log_in(administrator)
      redirect_to 'success'
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to 'new'
  end
end
