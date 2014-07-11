class Mooring < ActiveRecord::Base
  has_many :reservations
  belongs_to :user
  belongs_to :harbor

  validates :harbor, presence: true
  validates :user, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :state, presence: true
  validates :price, presence: true
end
