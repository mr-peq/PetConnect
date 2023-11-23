class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def account
    @user = current_user
    @pet = @user.pet
    @services = @user.services
    @bookings = @user.bookings
    @reviews = @user.reviews
  end
end
