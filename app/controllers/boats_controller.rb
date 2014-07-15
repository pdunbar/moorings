class BoatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boats = current_user.boats
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save
      flash[:notice] = 'Success'
      redirect_to boats_path
    else
      flash.now[:notice] = 'Error'
      render :new
    end
  end

  private

  def boat_params
    params.require(:boat).permit(:type_of, :length)
  end
end
