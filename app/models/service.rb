class Service < ApplicationRecord
  belongs_to :user

  include PgSearch::Model

  pg_search_scope :global_search,
    against: [:title, :address],
    associated_against: {
      user: [:first_name, :last_name]
    },
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :category_search,
    associated_against: {
      service_pet_category: [:pet_category]
    }

  has_many :bookings, dependent: :destroy
  has_many :service_pet_categories, dependent: :destroy
  has_many :pet_categories, through: :service_pet_categories
end
