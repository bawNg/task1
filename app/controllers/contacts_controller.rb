class ContactsController < ApplicationController

  def edit
    @user = User.find(params[:id])
    @set_contacts = Contact.connection.select_values('select contact_id from contacts where user_id  = '+@user.id.to_s)    
    @all_contacts = User.paginate :page => params[:page], :per_page => 10
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = "Successfully destroyed contact."
    redirect_to contacts_url
  end
end
