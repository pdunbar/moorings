class MooringsController < ApplicationController
  def index
    @moorings = Mooring.all
  end

  def new
    @mooring = Mooring.new
  end
end
