class User < ActiveRecord::Base
  belongs_to :coverage
  belongs_to :coverage_period
  has_many :contacts
  has_many :users, :through => :contact
  accepts_nested_attributes_for :coverage, :coverage_period

  def address_line_1
    #self.address.split('', 3).first
    ""
  end
  def address_line_1=value
  end
  def address_line_2
    #self.address.split('', 3).second
    ""
  end
  def address_line_2=value
  end
  def address_line_3
    #self.address.split('', 3).third
    ""
  end
  def address_line_3=value
  end

  def date_of_birth
    ""
  end
  def date_of_birth=value
    ""
  end

  def update_contacts(cids)
     if cids
#       contact_count = Contact.find_by_user_id(self.id).to_a.count

       cids.each do |id|
         #return if contact limit reached 
#         if contact_count >= 3
#            return
#         else
#           contact_count += 1
#         end

         if @contact = Contact.find(:first, :conditions=>['contact_id = ? and user_id=?', id,self.id])
         else @contact = self.contacts.build(:contact_id=>id)
         end
         @contact.save

       end
     end
  end

  def set_contacts
    Contact.find_all_by_user_id(self, :select => 'contact_id').map(&:contact_id)
  end
  
end
