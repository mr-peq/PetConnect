class Service < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :service_pet_categories, dependent: :destroy
  has_many :pet_categories, through: :service_pet_categories
end
