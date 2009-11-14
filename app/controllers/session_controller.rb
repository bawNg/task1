class SessionController < ApplicationController
  def login
    unless params[:username] == nil
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
    end
  end

end
