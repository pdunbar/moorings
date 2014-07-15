class Reservation < ActiveRecord::Base
  belongs_to :boat
  belongs_to :mooring

  validate :is_vacant?

  validates :boat, presence: true
  validates :mooring, presence: true
  validates :check_in, presence: true
  validates :check_out, presence: true

  def is_vacant?
    if mooring.reservations.where("check_in < ? AND check_out > ?", check_out, check_in).exists?
      errors.add(:check_in, "not available on this date")
      errors.add(:check_out, "not available on this date")
    end
  end
end
