class User < ActiveRecord::Base
  belongs_to :coverage
  belongs_to :coverage_period
  has_many :contacts
  has_many :users, :through => :contact
  accepts_nested_attributes_for :coverage, :coverage_period

  def update_contacts(cids)
     if cids
       contact_count = Contact.find_by_user_id(self.id).to_a.count

       cids.each do |id|
         #return if contact limit reached 
         if contact_count >= 3
            return
         else
           contact_count += 1
         end

         if @contact = Contact.find(:first, :conditions=>['contact_id = ? and user_id=?', id,self.id])
         else @contact = self.contacts.build(:contact_id=>id)
         end
         @contact.save

       end
     end
  end
  
end
