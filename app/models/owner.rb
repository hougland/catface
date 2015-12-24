class Owner < ActiveRecord::Base
  has_many :cats

  validates :name, presence: true
end
