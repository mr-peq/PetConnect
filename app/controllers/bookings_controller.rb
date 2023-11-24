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

    # Debugging
    puts "Date: #{params[:booking][:date]}, Hour: #{params[:booking]["start_time(4i)"]}, Minutes: #{params[:booking]["start_time(5i)"]}"

    # Combine date and time correctly
    date_string = "#{params[:booking][:date]} #{params[:booking]["start_time(4i)"]}:#{params[:booking]["start_time(5i)"]}"
    combined_start_time = DateTime.parse(date_string)

    # Set the start and end times
    @booking.start_time = combined_start_time
    @booking.end_time = combined_start_time + 1.hour

    if @booking.save
      redirect_to account_path, notice: 'Booking was successfully created.'
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
