class Admin::SessionsController < ApplicationController
  include Admin::SessionsHelper
  def new

  end

  def create
    administrator = Administrator.find_by(administratorname: params[:administratorname].downcase)
    if administrator && administrator.authenticate(params[:password])
      log_in_as_administrator(administrator)
      redirect_to '/admin/dashboard'
    else
      render 'new'
    end
  end

  def destroy
    log_out_from_administrator
    redirect_to 'new'
  end
end
