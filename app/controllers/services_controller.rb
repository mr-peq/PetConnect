class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  respond_to :html, :json

  def index
    @services = Service.all
    # @markers = @services.geocoded.map do |service|
    #   {
    #     lat: service.latitude,
    #     lng: service.longitude
    #   }
    # end

    respond_to do |format|
      if params[:query].present? && params[:query] != ""
        @services = Service.global_search(params[:query])
        if params[:filters].present? && params[:filters] != ""
          services_ids = match_filters(@services)
          @services = @services.find(services_ids.flatten)
          # @markers = @services.geocoded.map do |service|
          #   {
          #     lat: service.latitude,
          #     lng: service.longitude
          #   }
          # end
        end
        # format.json
        # format.html
      else
        if params[:filters].present? && params[:filters] != ""
          services_ids = match_filters(@services)
          @services = Service.find(services_ids.flatten)
          # @markers = @services.geocoded.map do |service|
          #   {
          #     lat: service.latitude,
          #     lng: service.longitude
          #   }
          # end
        end
        # format.json
        # format.html
      end

      format.json
      format.html
    end

  end

  def show
    @service = Service.find(params[:id])
    ## A passer en private et before_action après merging
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

  def match_filters(services)
    filters = params[:filters].split(',')
    services_ids = []
    filters.each do |filter|
      services_ids << services.category_search(filter).ids
    end
    services_ids
  end
end
