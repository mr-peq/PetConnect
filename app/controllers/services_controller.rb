class ServicesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.save
  # No need for app/views/restaurants/create.html.erb
    redirect_to service_path(@service)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def service_params
    params.require(:service).permit(:title, :description, :price, :availabilities, :user, :address)
  end

end
