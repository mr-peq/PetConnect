class Pet < ApplicationRecord
  belongs_to :pet_category
  belongs_to :user

  has_one_attached :pet_picture

  validates :pet_category_id, presence: true
  validates :pet_picture, content_type: { in: ['image/png', 'image/jpg', 'image/jpeg'], message: 'must be a valid image format' }
  validates :pet_picture, size: { less_than: 5.megabytes, message: 'should be less than 5MB' }
end
