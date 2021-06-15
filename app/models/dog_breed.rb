class DogBreed < ApplicationRecord
  belongs_to :genre
  has_many:comments, dependent: :destroy
  has_many:favorites, dependent: :destroy

  attachment :dog_image
end
