class Admin::SessionsController < ApplicationController
  include Admin::SessionsHelper
  def new
    if (logged_in_as_administrator?)
      redirect_to '/admin/dashboard'
    end

  end

  def create
    administrator = Administrator.find_by(administratorname: params[:administratorname].downcase)
    if administrator && administrator.authenticate(params[:password])
      if administrator.second_password_enabled
        session[:admin_id_for_further_verfication] = administrator.id
        redirect_to '/admin/verification'
      else
        log_in_as_administrator(administrator)
        redirect_to '/admin/dashboard'
      end

    else
      render 'new'
    end
  end

  def verification




  end

  def authenticate
    id = session[:admin_id_for_further_verfication]
    puts (id)
    administrator = Administrator.find_by(id: id)
    session.delete(:admin_id_for_further_verfication)
    puts(administrator)
    if administrator && administrator.authenticate_second_password(params[:second_password])
      redirect_to '/admin/dashboard'
    else
      render 'verification'
    end
  end

  def destroy
    log_out_from_administrator
    redirect_to 'new'
  end
end
