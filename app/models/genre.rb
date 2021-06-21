class Genre < ApplicationRecord
  has_many :dogbreeds

  validates :name, presence: true
end
