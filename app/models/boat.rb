class Boat < ActiveRecord::Base
  has_many :reservations
  belongs_to :user

  validates :type, presence: true
  validates :length, presence: true
  validates :user, presence: true
end
