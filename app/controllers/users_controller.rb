class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create

    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to "/contacts/edit/#{@user.id}"
    else
      flash[:error] = "Unable to create new user!"
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update

    @user = User.find(params[:id])
    if raw_cids = params[:rawcids]
       @user.update_contacts(raw_cids.split(","))  

      redirect_to user_path
    else
      if @user.update_attributes(params[:user])
        flash[:notice] = "Successfully updated user."
        redirect_to @user
      else
        flash[:error] = "Failed to update user."
        render :action => 'edit'

      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end

  def send_registration_confirmation_email
    @user = User.find(params[:user])
    UserMailer.deliver_registration_confirmation(@user)
  end

  def send_contact_information_email
    @recipient = User.find(params[:recipient])
    @sender = User.find(params[:sender])
    UserMailer.deliver_contact_information(@recipient, @sender, params[:message])
  end
end
