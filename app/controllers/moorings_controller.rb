class MooringsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @moorings = Mooring.all
    if params[:start_date]
      @start_date = Date.parse(params[:start_date]).strftime("%Y%m%d")
      @end_date = Date.parse(params[:end_date]).strftime("%Y%m%d")
    end
    if !params[:start_date] && !params[:end_date]
      respond_to do |format|
        format.html
        format.json { render json: @moorings.map{|e| e.to_json}}
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: @moorings.map{|e| e.to_json(params[:start_date], params[:end_date])}}
      end
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

  private


  def mooring_params
    params.require(:mooring).permit(:harbor_id, :user_id, :state, :price, :latitude, :longitude)
  end
end

