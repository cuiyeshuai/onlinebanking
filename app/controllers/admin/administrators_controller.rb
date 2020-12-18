class Admin::AdministratorsController < Admin::AdminController
  include Admin::SessionsHelper
  def index
    @administrators = Administrator.order("id ASC")
  end

  def show
  end

  def new
    @administrator = Administrator.new
  end

  def create
    @administrator = Administrator.new(params.require(:administrator).permit(:administratorname, :password,:password_confirmation,:second_password_enabled, :second_password, :second_password_confirmation))
    if !params[:administrator][:second_password_enabled]
      @administrator.second_password = ""
      @administrator.second_password_confirmation = ""

    end
    puts (@administrator.second_password_enabled)
    @administrator.save
    puts(@administrator.errors.messages)
    redirect_to admin_administrators_path
  end

  def edit
    @administrator = Administrator.find(params[:id])
  end

  def update
    @administrator = Administrator.find(params[:id])

    if params[:administrator][:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    if params[:administrator][:second_password_enabled] && params[:administrator][:second_password] != ""
      @administrator.second_password = params[:administrator][:second_password]
      @administrator.second_password_confirmation = params[:administrator][:second_password_confirmation]
    else
      @administrator.second_password = ""
      @administrator.second_password_confirmation = ""
    end
    @administrator.update(params.require(:administrator).permit(:administratorname, :second_password_enabled, :password, :password_confirmation))

    redirect_to admin_administrators_path
  end

  def delete
    @administrator = Administrator.find(params[:id])
  end

  def destroy
    @administrator = Administrator.find(params[:id])
    if @administrator == current_administrator
      @administrator.destroy
      log_out_from_administrator
      redirect_to '/admin'
    else
      @administrator.destroy
      redirect_to admin_administrators_path
    end

  end
end
