class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  VALID_NAME = /\A[ぁ-んァ-ン一-龥]/.freeze
  VALID_NAME_KANA = /\A[ァ-ヶー－]+\z/.freeze

  validates :nickname, presence: true
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: 'Include both letters and numbers' }
  validates :password_confirmation, presence: true, format: { with: VALID_PASSWORD_REGEX, message: 'Include both letters and numbers' }

  validates :first_name, presence: true, format: { with: VALID_NAME, message: 'Full-width characters' }
  validates :last_name, presence: true, format: { with: VALID_NAME, message: 'Full-width characters' }

  validates :first_name_kana, presence: true, format: { with: VALID_NAME_KANA, message: 'Full-width katakana characters' }
  validates :last_name_kana, presence: true, format: { with: VALID_NAME_KANA, message: 'Full-width katakana characters' }

  validates :birthday, presence: true
end
