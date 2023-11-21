class ServicesController < ApplicationController
  def index
    # link_to services_path(animal: "dog")
    # if params[:animal] == dog
    # @services = Service.where...
    if params[:query].present?
      @services = Service.global_search(params[:query])
    else
      @services = Service.all
    end

    if params[:animal] == "Dog"
      services = Service.global_search(params[:query])
      @services = services.joins(:pet_categories).where(pet_categories: { pet_category: "Dog" })
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

end
