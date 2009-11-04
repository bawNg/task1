class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :address, :state, :city, :postal_code, :height, :weight, :is_smoker, :email_address, :coverage, :coverage_period
end
