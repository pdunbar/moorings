class MooringsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @moorings = Mooring.all
    respond_to do |format|
      format.html
      format.json { render json: @moorings.map{|e| e.to_json}}
    end
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
    moorings_json(moorings_grey)
  end


  def moorings_grey
    '#550022'
  end


  def moorings_vacant_today(date = Date.today)
    if mooring.reservations.find_by("check_in < ?  AND check_out > ?", date, date)
      '#FF0000'
    else
      '#2bC12B'
    end
  end


  def moorings_json(color_picker)
    @moorings = Mooring.all
    @geojson = Array.new
    @moorings.each do |mooring|
      color = color_picker
      @geojson << mooring.to_json
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

