class User < ActiveRecord::Base
  belongs_to :coverage
  belongs_to :coverage_period
  belongs_to :profile
  has_many :contactships
  has_many :contacts, :through => :contactships
  accepts_nested_attributes_for :coverage, :coverage_period
  validates_presence_of :first_name, :last_name, :address,
                        :city, :contact_number, :email_address,
                        :state, :coverage_period, :coverage,
                        :date_of_birth, :postal_code, :height,
                        :weight
  validates_format_of :contact_number,
                      :with => /^[0-9]{3}\s[0-9]{3}\s[0-9]{4}$/,
                      :message => "Invalid format, xxx xxx xxxx, 10 digits only"
  validates_format_of :weight,
                      :with => /^[0-9]{1,3}\.0$/,
                      :message => "3 digits only"
  validates_format_of :height,
                      :with => /^[0-9]{1,4}\.0$/,
                      :message => "4 digits only" 
  validates_format_of :postal_code,
                      :with => /^[0-9]{6}$/,
                      :message => "6 digits only"
  validates_format_of :email_address,
                      :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/,
                      :message => "appears not to be valid"
  validates_uniqueness_of :email_address



  def update_contacts(cids) # method takes an array of user id's and creates a contact relationship with instance of user
    if cids
       cids.each do |id|
         if contactship = Contactship.find(:first, :conditions=>['contact_id = ? and user_id=?', id,self.id])
         else contactship = self.contactships.build(:contact_id=>id)
         end
         contactship.save
       end
     end
  end

  def current_contact_ids #gets an array of contact id's that have already been set
    Contactship.find_all_by_user_id(self, :select => 'contact_id').map(&:contact_id)
  end
  
end
