class DogBreed < ApplicationRecord
  belongs_to :genre
  belongs_to:comment
  belongs_to:favorite

  attachment :dog_image
end
