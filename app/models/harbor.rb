class Harbor < ActiveRecord::Base
  has_many :moorings

  validates :name, presence: true
  validates :state, presence: true
end
