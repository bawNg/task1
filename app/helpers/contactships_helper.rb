module ContactshipsHelper
  def check_selected_contacts(cid)   #sets a checkbox to checked if it belongs to contact
     current_contacts = @user.current_contact_ids
     current_contacts.each do |x|
     if x.to_s == cid.to_s
       return 'checked'
     end
    end
     return nil
  end
end
