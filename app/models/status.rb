class Status < ActiveRecord::Base
  belongs_to :cat

  validates :status, presence: true
  validates :cat_id, presence: true
end
