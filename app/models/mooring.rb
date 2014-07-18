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

  def is_reserved?(start_date, end_date)
    reservations.where("check_in < ? AND check_out > ?", end_date, start_date).exists?
  end


  def to_json(start_date = Date.today, end_date = Date.tomorrow)
    if is_reserved?(start_date, end_date)
      color = '#FF0000'
    else
      color = '#33CC33'
    end

    {
      type: 'Feature',
      geometry: {
        type: 'Point',
        coordinates: [longitude, latitude]
      },
      properties: {
        name: harbor.name,
        location: 'Long: mooring.longitude, Lat: #{mooring.latitude}',
        :'marker-color' => color,
        :'marker-symbol' => 'harbor',
        :'marker-size' => 'medium',
      }
    }
  end
end
