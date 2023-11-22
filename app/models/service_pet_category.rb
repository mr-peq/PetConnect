class ServicePetCategory < ApplicationRecord
  belongs_to :pet_category
  belongs_to :service

  include PgSearch::Model
end
