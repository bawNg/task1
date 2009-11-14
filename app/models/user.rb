class User < ActiveRecord::Base
  belongs_to :coverage
  belongs_to :coverage_period
  has_many :contacts
  has_many :contactees , :through => :contacts
  accepts_nested_attributes_for :coverage, :coverage_period
  validates_presence_of :first_name, :last_name, :address, :city, :contact_number, :email_address, :state, :coverage_period, :coverage, :date_of_birth, :postal_code, :height, :weight
  validates_format_of :contact_number,
                      :with => /^(\+[0-9]{0,4}\s)?[0-9\s]*$/,
                      :message => "Invalid, can contain +code xxxxxxx OR xxxxxxx"
  validates_format_of :email_address,
                      :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/,
                      :message => "appears not to be valid"
  validates_uniqueness_of :email_address



  def update_contacts(cids)
     if cids
       cids.each do |id|
         if @contact = Contact.find(:first, :conditions=>['contactee_id = ? and user_id=?', id,self.id])
         else @contact = self.contacts.build(:contactee_id=>id)
         end
         @contact.save
       end
     end
  end

  def set_contacts
    Contact.find_all_by_user_id(self, :select => 'contactee_id').map(&:contactee_id)
  end
  
end
