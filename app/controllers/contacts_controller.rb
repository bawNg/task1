class ContactsController < ApplicationController
  def create
    params[:cids] ||= []
    if user = User.find(params[:uid])
      params[:cids].each do |id|
         @contact = user.contacts.build(:contact_id=>id)
        if @contact.save
          flash[:notice].concat("Successfully updated contact.<br/>")
          render user_path(user)
        else
          render :action => 'edit'
        end
      end
    else
      render user_path
    end

  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = "Successfully destroyed contact."
    redirect_to contacts_url
  end
end
