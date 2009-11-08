class Contact < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_contact, :class_name => :user, :foreign_key => :contact_id 
end
