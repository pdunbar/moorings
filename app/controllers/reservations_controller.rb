class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end
end
