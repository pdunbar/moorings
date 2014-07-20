class MooringSearch
  attr_accessor :search

  def initialize(params)
    @params = params
    if !params[:harbor_search]
      @search = "Belfast, ME"
      params[:harbor_search] = @search
    else
      @search = params[:harbor_search]
    end
  end

  def start_date
    return @start_date if @start_date.present?

    start_date_string = params[:start_date]

    if start_date_string.present?
      @start_date = Date.parse(start_date_string).strftime("%Y%m%d")
    else
      @start_date = Date.today.strftime("%Y%m%d")
    end
  end

  def harbor
    @harbor ||= geocode(search)
  end

  def center_location
    {
      latitude: harbor.lat,
      longitude: harbor.lng,
    }
  end

  private

  def geocode(options)
    Geokit::Geocoders::GoogleGeocoder.geocode(options)
  end
end

# describe MooringSearch do
#   describe "#start_date" do
#     it "returns the given string as a date" do
#       params = { start_date: '2012-10-2' }
#       search = MooringSearch.new(params)

#       expect(search.start_date).to eq Date.parse('2012-10-2')
#     end

#     it "returns today's date of no start_date is given" do
#       params = { start_date: '' }
#       search = MooringSearch.new(params)

#       expect(search.start_date).to eq Date.today
#     end
#   end
# end
