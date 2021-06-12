class DogBreed < ApplicationRecord
  belongs_to :genre
  has_many:comments
  has_many:favorites

  attachment :dog_image
end
