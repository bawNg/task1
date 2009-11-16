class Contact < ActiveRecord::Base
  has_many :contactships
  has_many :users, :through => :contactships
end
