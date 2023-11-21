class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :services, dependent: :destroy
  # This will give you all bookings for all services offered by the user
  has_many :bookings, through: :services
  # This will give you all reviews for all bookings for all services by the user
  has_many :reviews, through: :bookings

  has_one_attached :photo

  def average_rating
    total_ratings = self.reviews.sum(:rating)
    total_reviews = self.reviews.count
    total_reviews.positive? ? total_ratings.to_f / total_reviews : 0
  end
end
