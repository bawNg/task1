class ContactshipsController < ApplicationController
   def edit
    @user = User.find(params[:id])
    @all_contacts = Contact.paginate :page => params[:page], :per_page => 5
    @contact_count = 0 #for storing the current paginations contact count
    @overall_count = 0 #for setting the initial overall count of selected contacts
    contact_count = Contact.find(:all).count
    unless contact_count >= 3   #This is to make sure a user can pass validation if there are less selectable users than the min reqiuired
      @contact_count = 3-contact_count
      @overall_count = 3-contact_count
    end

  end
end
