class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  valid_kana_kanji_regex = /\A[一-龥ぁ-ん]+\z/
  valid_katakana_regex = /\A[ァ-ヶー－]+\z/
  with_options presence: true do
    validates :nickname, length: { maximum: 40 }
    validates :family_name_kanji, format: { with: valid_kana_kanji_regex }
    validates :first_name_kanji, format: { with: valid_kana_kanji_regex }
    validates :family_name_katakana, format: { with: valid_katakana_regex }
    validates :first_name_katakana, format: { with: valid_katakana_regex }
    validates :birth_day
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i }
  end
end
