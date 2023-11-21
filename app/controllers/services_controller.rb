class ServicesController < ApplicationController

  respond_to :html, :json

  def index
    respond_to do |format|
      if params[:query].present? && params[:query] != ""
        @services = Service.global_search(params[:query])
        format.json
        format.html
      else
        @services = Service.all
        format.html
      end


      if params[:filters].present? && params[:filters] != ""
        puts params[:filters]
        filters = params[:filters].split(',')
        puts filters
        services_ids = []
        filters.each do |filter|
          services_ids << @services.category_search(filter).ids
        end
        @services = Service.find(services_ids.flatten)
        format.json
        format.html
      end
    end

    # if params[:animal] == "Dog"
    #   services = Service.global_search(params[:query])
    #   @services = services.joins(:pet_categories).where(pet_categories: { pet_category: "Dog" })
    # end
    # link_to services_path(animal: "dog")
    # if params[:animal] == dog
    # @services = Service.where...
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

end
