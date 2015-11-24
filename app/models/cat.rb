class Cat < ActiveRecord::Base
  belongs_to :owner
  has_many :status
end
