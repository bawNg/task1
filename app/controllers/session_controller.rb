class SessionController < ApplicationController
  def login
  end

  def logincheck
    @user = User.find_by_email_address(params[:username])
    unless @user == nil
     if @user.password == params[:password]
       flash[:notice] = "Login successful"
     else
       flash[:error] = "Incorrect username and/or password"
     end
    else
      flash[:error] = "Incorrect username and/or password"
    end 
     redirect_to login_path
  end
end
