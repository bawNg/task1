module ContactHelper
  def check_selected_contacts(cid)
     @set_contacts.each do |x|
     if x.to_s == cid.to_s
       return 'checked'
     end
    end
     return nil
  end
end
