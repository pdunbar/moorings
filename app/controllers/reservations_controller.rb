class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @mooring = Mooring.find(params[:mooring_id])
    @reservation = Reservation.new
  end

  def create
    @mooring = Mooring.find(params[:mooring_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.mooring = @mooring
    if @reservation.save
      flash[:notice] = 'Success'
      redirect_to moorings_path
    else
      flash.now[:notice]
      render :new
    end
  end

  def index
    @reservations = current_user.reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private

  def has_reservation?
    if current_user.reservations == nil
      false
    else
      true
    end
  end

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :boat_id)
  end
end
