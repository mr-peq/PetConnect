class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

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
      redirect_to service_path(@service), notice: 'service was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
    redirect_to account_path, notice: 'service was successfully deleted.'
  end

  private

  def service_params
    params.require(:service).permit(:title, :description, :price, :availabilities, :user, :address)
  end

  def set_service
    @service = Service.find(params[:id])
  end
end
