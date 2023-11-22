class PetsController < ApplicationController

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to account_path, notice: 'Pet was successfully added.'
    else
      flash[:alert] = 'Error adding pet.'
      redirect_to account_path
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :pet_category_id, :pet_picture)
  end
end
