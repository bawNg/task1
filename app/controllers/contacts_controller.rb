class ContactsController < ApplicationController

  def edit
    @user = User.find(params[:id])  
    @all_contacts = User.paginate :page => params[:page], :per_page => 5
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = "Successfully destroyed contact."
    redirect_to contacts_url
  end
end
