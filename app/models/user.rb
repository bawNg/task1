class User < ActiveRecord::Base
  belongs_to :coverage
  belongs_to :coverage_period
  has_many :users, :through=>:contact_id
  accepts_nested_attributes_for :coverage, :coverage_period
end
