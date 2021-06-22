class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :dog_breed

end
