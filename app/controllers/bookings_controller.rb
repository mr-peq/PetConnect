class BookingsController < ApplicationController
  before_action :set_service, only: [:create, :edit]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = @service.bookings.new(booking_params)
    @booking.user = current_user
    # Set the end_time to be one hour after the start_time
    combined_start_time = DateTime.parse("#{params[:booking][:date]} #{params[:booking][:start_time]}")
    @booking.start_time = combined_start_time
    @booking.end_time = combined_start_time + 1.hour

    if @booking.save
      redirect_to service_path(@service), notice: 'Booking was successfully created.'
    else
      render 'services/show', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to account_path, notice: 'booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to account_path, notice: 'booking was successfully deleted.'
  end

private

  def set_service
    @service = Service.find(params[:service_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_time)
  end
end
