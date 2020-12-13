class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buyers

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  with_options presence: true, format: { with: NAME_REGEX, message: 'is invalid. Input full-width characters.' } do
    validates :family_name
    validates :first_name
  end
  with_options presence: true, format: { with: NAME_KANA_REGEX, message: 'is invalid. Input full-width katakana characters.' } do
    validates :family_name_kana
    validates :first_name_kana
  end
  with_options presence: true do
    validates :birth_day
    validates :nickname
  end
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Password Include both letters and numbers'
end
