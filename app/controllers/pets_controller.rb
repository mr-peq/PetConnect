class PetsController < ApplicationController
  def create
    @pet = Pet.new(pet_params)
    @pet.save
    redirect_to pet_path(@pet)
  end

  private

  def pet_params
  params.require(:pet).permit(:name, :pet_category)
  end

end
