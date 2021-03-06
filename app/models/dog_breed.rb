class DogBreed < ApplicationRecord
  belongs_to :genre
  # 犬種が削除された際にコメント・タグ消去
  has_many:comments, dependent: :destroy
  has_many:tags, dependent: :destroy

  # 検索
  def self.search_for(content, method)
    # 完全一致
    if method == 'perfect'
      DogBreed.where(dog_name: content)
    # 前方一致
    elsif method == 'forward'
      DogBreed.where('dog_name LIKE ?', content+'%')
    # 後方一致
    elsif method == 'backward'
      DogBreed.where('dog_name LIKE ?', '%'+content)
    # 部分一致
    else
      DogBreed.where('dog_name LIKE ?', '%'+content+'%')
    end
  end

  # 画像投稿
  attachment :dog_image

  # バリデーション
  validates :genre_id, :dog_name, presence: true
  validates :dog_introduction, length: {maximum: 200}
end
