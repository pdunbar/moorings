class MooringsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @moorings = Mooring.all
    @geojson = Array.new
    moorings_json
  end

  def new
    @mooring = Mooring.new
  end

  def create
    @mooring = Mooring.new(mooring_params)
    @mooring.user = current_user
    if @mooring.save
      flash[:notice] = 'Success'
      redirect_to moorings_path
    else
      flash.now[:notice] = 'Error'
      render :new
    end
  end

  def show
    @mooring = Mooring.find(params[:id])
    moorings_json
  end



  def moorings_json
    @moorings = Mooring.all
    @geojson = Array.new
    # @moorings_with = Mooring.where
    # # @mooring_without =

    @moorings.each do |mooring|
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [mooring.longitude, mooring.latitude]
        },
        properties: {
          name: mooring.harbor.name,
          location: 'Long: mooring.longitude, Lat: #{mooring.latitude}',
          :'marker-color' => '#2BC12B',
          :'marker-symbol' => 'harbor',
          :'marker-size' => 'medium'
        }
      }
    end

    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end
  end

  private

  def mooring_params
    params.require(:mooring).permit(:harbor_id, :user_id, :state, :price, :latitude, :longitude)
  end
end
