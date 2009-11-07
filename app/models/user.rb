class User < ActiveRecord::Base
  belongs_to :coverage
  belongs_to :coverage_period
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
end
