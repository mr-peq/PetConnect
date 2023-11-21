class PetCategory < ApplicationRecord
  has_many :pets
  has_many :service_pet_categories
end
