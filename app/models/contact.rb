class Contact < ActiveRecord::Base
  belongs_to :user
  belongs_to :contactee, :class_name => "User"
end
