class Cat < ActiveRecord::Base
  belongs_to :owner
  has_many :status

  validates :name, presence: true
  validates :owner_id, presence: true
end
