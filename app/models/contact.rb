class Contact < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact, :class_name => "user"
end
