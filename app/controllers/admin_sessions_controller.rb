class AdminSessionsController < ApplicationController
   def login
   end
 
   def verification
     @admin = Administrator.find_by(username: params[:username])
     if @admin && @admin.password == params[:password]
        session[:user_id] = @user.id
 
        redirect_to '/success'
     else
        redirect_to '/login'
     end
   end
 
   def success
   end
end
