class UsersController < UserController
  include SessionsHelper
  def show
    @gender = ["-","Male","Female"]
    @user = current_user
  end
end
