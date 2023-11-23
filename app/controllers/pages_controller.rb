class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def account
    @user = current_user
    @pet = Pet.new
    @service = Service.new
    @services = @user.services
    @bookings = Booking.where(user_id: current_user.id)
    @reviews = @user.reviews
  end
end
