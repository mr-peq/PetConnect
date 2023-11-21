class Pet < ApplicationRecord
  belongs_to :pet_category
  belongs_to :user

  has_one_attached :photo

  validates :pet_category, presence: true
end
