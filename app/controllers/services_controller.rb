class ServicesController < ApplicationController
  def index
    @services = Service.all
    @user = User.first
  end

  def show
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
