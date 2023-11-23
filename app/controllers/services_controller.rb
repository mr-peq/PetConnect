class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: [:index]
  respond_to :html, :json


  def index
    @services = Service.all

    if params[:query].present? && params[:query] != ""
      @services = Service.global_search(params[:query])
      if params[:filters].present? && params[:filters] != ""
        services_ids = match_filters(@services)
        @services = @services.where(id: services_ids.flatten)
      end
    else
      if params[:filters].present? && params[:filters] != ""
        services_ids = match_filters(@services)
        @services = @services.where(id: services_ids.flatten)
      end
    end
    @markers = @services.geocoded.map do |service|
      {
        lat: service.latitude,
        lng: service.longitude
      }
    end
  end

  def show
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    if @service.save
      redirect_to account_path, notice: 'Service was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    # Routes à updater
    if @service.update(service_params)
      redirect_to account_path, notice: 'Service was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
    redirect_to account_path, notice: 'Service was successfully deleted.'
  end

  private

  def service_params
    params.require(:service).permit(:title, :description, :price, :availabilities, :user, :address, :service_picture, pet_category_ids: [])
  end

  def set_service
    @service = Service.find(params[:id])
  end

  def match_filters(services)
    filters = params[:filters].split(',')
    services_ids = []
    filters.each do |filter|
      services_ids << services.category_search(filter).ids
    end
    services_ids
  end
end
