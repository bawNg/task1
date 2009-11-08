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
    s = self.address.split('', 3)
    s[0] = value
    self.address = s
  end
  def address_line_2
    #self.address.split('', 3).second
    ""
  end
  def address_line_2=value
    s = self.address.split('', 3)
    s[1] = value
    self.address = s
  end
  def address_line_3
    #self.address.split('', 3).third
    ""
  end
  def address_line_3=value
    s = self.address.split('', 3)
    s[2] = value
    self.address = s
  end

  def date_of_birth
    ""
  end
  def date_of_birth=value
    ""
  end

  def update_contacts(cids)
     if cids
       cids.each do |id|
         if @contact = Contact.find(:first, :conditions=>['contact_id = ? and user_id=?', id,self.id])
         else @contact = self.contacts.build(:contact_id=>id)
         end
         @contact.save

       end
     end
  end
  
end
