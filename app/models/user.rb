class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch::Model

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :services, dependent: :destroy
  has_many :bookings, through: :services, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  has_one :pet, dependent: :destroy

  has_many_attached :photos

  def average_rating
    total_ratings = self.reviews.sum(:rating)
    total_reviews = self.reviews.count
    total_reviews.positive? ? total_ratings.to_f / total_reviews : 0
  end
end
