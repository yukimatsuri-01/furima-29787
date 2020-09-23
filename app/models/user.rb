class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 40 }
  with_options presence: true do
    validates :family_name_kanji, format: { with: /\A[一-龥ぁ-ん]+\z/ }
    validates :first_name_kanji, format: { with: /\A[一-龥ぁ-ん]+\z/ }
    validates :family_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/ }
  end
  validates :birth_day, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i }
end
