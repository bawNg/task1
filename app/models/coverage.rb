class Coverage < ActiveRecord::Base
  has_many :users

  def to_s
    self.amount
  end
end
