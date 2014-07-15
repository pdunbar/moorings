class User < ActiveRecord::Base
  has_many :boats
  has_many :moorings
  has_many :reservations, through: :boats

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def has_reservation?

  end
end
