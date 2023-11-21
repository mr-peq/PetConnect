class BookingsController < ApplicationController
  before_action :set_service, only: [:create]

  def index
  end

  def show
  end

  def new
  end

  def create
    @booking = @service.bookings.new(booking_params)
    @booking.user = current_user

    # Set the end_time to be one hour after the start_time
    @booking.end_time = @booking.start_time + 1.hour

    if @booking.save
      redirect_to service_path(@service), notice: 'Booking was successfully created.'
    else
      render 'services/show', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def set_service
    @service = Service.find(params[:service_id])
  end

  def booking_params
    params.require(:booking).permit(:start_time)
  end
end
