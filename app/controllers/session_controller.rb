require "md5"
#Used for the temporary login page
class SessionController < ApplicationController
  def login
    unless params[:username] == nil
     @user = User.find_by_email_address(params[:username])
     unless @user == nil
       if @user.profile.password == MD5.new(params[:password]).to_s
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
# When doing the real login page, remember to filter the password from the request string.