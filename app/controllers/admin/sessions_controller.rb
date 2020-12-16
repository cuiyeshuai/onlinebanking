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
    if (!session[:admin_id_for_further_verfication])
      render :file => 'public/404.html', status => :not_found, :layout => false
    end


  end

  def authenticate
    if (!session[:admin_id_for_further_verfication])
      render :file => 'public/404.html', status => :not_found, :layout => false
    end
    id = session[:admin_id_for_further_verfication]

    administrator = Administrator.find_by(id: id)
    session.delete(:admin_id_for_further_verfication)
    puts(administrator)
    if administrator && administrator.authenticate_second_password(params[:second_password])
      log_in_as_administrator(administrator)
      redirect_to '/admin/dashboard'
    else
      render 'verification'
    end
  end

  def destroy
    log_out_from_administrator
    redirect_to '/admin/'
  end
end
