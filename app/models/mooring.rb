class Mooring < ActiveRecord::Base
  has_many :reservations
  belongs_to :user
  belongs_to :harbor

  validates :harbor, presence: true
  validates :user, presence: true
  validates :price, presnce: true
end
