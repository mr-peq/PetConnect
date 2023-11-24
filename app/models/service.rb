class Service < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model

  pg_search_scope :global_search,
    against: [:title, :address, :description],
    associated_against: {
      user: [:first_name, :last_name]
    },
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :category_search,
    associated_against: {
      pet_categories: [:pet_category]
    }

  has_many :bookings, dependent: :destroy
  has_many :service_pet_categories, dependent: :destroy
  has_many :pet_categories, through: :service_pet_categories
  has_one_attached :service_picture
  validates :service_picture, presence: true

  def average_rating
    ratings_sum = 0
    ratings_count = 0
    bookings.each do |booking|
      if booking.review
        ratings_sum += booking.review.rating.to_f
        ratings_count += 1
      end
    end
    if ratings_count.zero?
      0
    else
      ratings_sum / ratings_count
    end
  end
end
