require "md5"
class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])  
  end
  
  def new
    @user = User.new
    @address = ['','','']
  end

  def create
    @user = User.new(params[:user])
    @user.address= params[:address1].concat("\n"+params[:address2]).concat("\n"+params[:address3])
    @profile =  Profile.new
    password =  generate_password(8) #generate a password for the user, should be changed to store as md5 or other encrypted
    @profile.password= MD5.new(password).to_s
    if @user.save!
      @profile.user_id= @user.id
      @profile.save!
      @user.profile_id= @profile.id
      @user.save
      UserMailer.deliver_registration_confirmation(@user,password)    #send confirmation of registration email
      flash[:notice] = "Successfully created user."
      redirect_to "/contactships/edit/#{@user.id}"
    else
      flash[:error] = "Unable to create new user!"
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @address = @user.address.split("\n")


  end
  
  def update
    @user = User.find(params[:id])

    if raw_cids = params[:rawcids] #checks if there are contact id's sent
      cids = raw_cids.split(",")
      @user.update_contacts(cids)  # create all new contacts
      @user.contacts.each do |contact|  #Loops through all contacts and sends them email from user
        next unless cids.include? contact.id.to_s #a check so that messages aren't sent non-new contacts of the user
        UserMailer.deliver_contact_information( contact, @user, params[:email_message])
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

end
