class Admin::UsersController < Admin::AdminController
  def index
    @gender = ["-","Male","Female"]
    @users = User.order("id ASC")
  end

  def show
    @gender = ["-","Male","Female"]
    @user = User.find(params[:id])
    @bankAccounts = @user.bank_accounts
  end

  def new
    @user = User.new

  end


  def create
    @user = User.new
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.gender = Integer(params[:user][:gender])
    @user.phone_number = params[:user][:phone_number]
    @user.address = params[:user][:address]
    @user.date_of_birth = Time.local(Integer(params[:user]["date_of_birth(1i)"]),Integer(params[:user]["date_of_birth(2i)"]),Integer(params[:user]["date_of_birth(3i)"]))
    if (@user.save)
      redirect_to admin_users_path
    else
      alert = ""
      @user.errors.messages.each do |att, reason|
        alert += (String(att) + ": " + reason[0] +";")
      end
      flash.now[:alert] = alert

      render 'new'
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.date_of_birth = Time.local(Integer(params[:user]["date_of_birth(1i)"]),Integer(params[:user]["date_of_birth(2i)"]),Integer(params[:user]["date_of_birth(3i)"]))
    @user.gender = Integer(params[:user]["gender"])
    if @user.update((params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :phone_number, :address)))
      redirect_to admin_users_path
    else
      alert = ""
      @user.errors.messages.each do |att, reason|
        alert += (String(att) + ": " + reason[0] +";")
      end
      flash.now[:alert] = alert

      render 'edit'
    end
  end

  def delete
    @user = User.find(params[:id])
    @gender = ["-","Male","Female"][@user.gender]

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(admin_users_path)
  end
end
