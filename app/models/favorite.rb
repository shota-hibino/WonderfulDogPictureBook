class Favorite < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :dogbreeds, dependent: :destroy
end
