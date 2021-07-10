class Genre < ApplicationRecord
  has_many :dogbreeds

  # バリデーション
  validates :name, presence: true
end
