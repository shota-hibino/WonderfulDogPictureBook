class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :dog_breed
  has_many:favorites, dependent: :destroy

  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end
end
