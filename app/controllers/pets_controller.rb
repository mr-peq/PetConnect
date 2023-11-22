class PetsController < ApplicationController
  def create
    @pet = Pet.new(pet_params)
    @pet.save
    redirect_to account_path
  end

  private

  def pet_params
  params.require(:pet).permit(:name, :pet_category)
  end

end
