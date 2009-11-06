class User < ActiveRecord::Base
  belongs_to :coverage
  belongs_to :coverage_period
  has_many :users, :through=>:contact
  accepts_nested_attributes_for :coverage, :coverage_period

<<<<<<< HEAD:app/models/user.rb
  def updatecontacts(contact_ids)
    update_attribute(users,contact_ids)
=======
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
>>>>>>> 1305a8d0a96b10d8e71b0af632890e2e7549aac2:app/models/user.rb
  end
end
