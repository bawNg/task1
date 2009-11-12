class ContactsController < ApplicationController

  def edit
    @user = User.find(params[:id])  
    @all_contacts = User.paginate :page => params[:page], :per_page => 10
    @contact_count = 0
    @overall_count = 0
    user_count = User.find(:all).count
    unless user_count >= 3
      @contact_count = 3-user_count
      @overall_count = 3-user_count
    end           

  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = "Successfully destroyed contact."
    redirect_to contacts_url
  end
end
