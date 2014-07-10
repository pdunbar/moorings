class Reservation < ActiveRecord::Base
  belongs_to :boat
  belongs_to :mooring

  validates :boat, presence: true
  validates :mooring, presence: true
  validates :check_in, presence: true
  validates :check_out, presence: true
end
