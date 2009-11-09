class ContactsController < ApplicationController

  def edit
    @user = User.find(params[:id])
    @set_contacts = Contact.find_all_by_user_id(@user, :select => 'contact_id').map(&:contact_id)
    @all_contacts = User.paginate :page => params[:page], :per_page => 10
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = "Successfully destroyed contact."
    redirect_to contacts_url
  end
end
