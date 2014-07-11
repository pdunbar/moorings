class HarborsController < ApplicationController
  def index
    @harbors = Harbor.all
  end

  def new
    @harbor = Harbor.new
  end

  def create
    @harbor = Harbor.new(harbor_params)
    if @harbor.save
      redirect_to harbor_path(@harbor)
    else
      render :new
    end
  end

  def show
    @harbor = Harbor.find(params[:id])
  end

  private

  def harbor_params
    params.require(:harbor).permit(:name, :state, :description)
  end
end
