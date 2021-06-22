class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :first_name, :last_name, :first_name_kana, :last_name_kana, presence: true

  has_many:comments, dependent: :destroy
end
