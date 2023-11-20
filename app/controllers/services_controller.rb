class ServicesController < ApplicationController
  def index
  end

  def show
    @service = Service.find(params[:id])
    ## A passer en private et before_action après merging
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
