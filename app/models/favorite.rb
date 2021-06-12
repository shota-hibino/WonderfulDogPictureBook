class Favorite < ApplicationRecord
  belongs_to :member
  belongs_to :dogbreed
end
