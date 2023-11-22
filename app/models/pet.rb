class Pet < ApplicationRecord
  belongs_to :pet_category
  belongs_to :user

  has_one_attached :pet_picture

  validates :pet_category_id, presence: true
end
