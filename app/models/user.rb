class User < ActiveRecord::Base
  belongs_to :coverage
  belongs_to :coverage_period
  has_many :users, :through=>:contact
  accepts_nested_attributes_for :coverage, :coverage_period

  def updatecontacts(contact_ids)
    update_attribute(users,contact_ids)
  end
end
