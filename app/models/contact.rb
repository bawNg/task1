class Contact < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_contact, :class => :user
  

end
