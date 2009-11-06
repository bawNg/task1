class User < ActiveRecord::Base
  belongs_to :coverage
  belongs_to :coverage_period
  accepts_nested_attributes_for :coverage, :coverage_period
end
