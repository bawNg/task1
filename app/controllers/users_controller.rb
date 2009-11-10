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
    @user.password= generate_password(8)  
    if @user.save
      UserMailer.deliver_registration_confirmation(@user)
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
      cids = raw_cids.split(",")
      @user.update_contacts(cids)
      @user.contacts.each do |contact|
        next unless cids.include? contact.id
        send_contact_information_email contact, @user, params[:message]
      end
      flash[:notice] = "Sent emails to contacts."
      redirect_to @user
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

  private
  def send_contact_information_email(recipient, sender, message)
    @recipient = User.find(recipient)
    @sender = User.find(sender)
    UserMailer.deliver_contact_information(@recipient, @sender, message)
  end
end
