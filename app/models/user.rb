class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products

  valid_name_regex = /\A[ぁ-んァ-ヶ一-龥々]+\z/
  valid_name_kana_regex = /\A[ァ-ヶー－]+\z/
  valid_password_regex = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  with_options presence: true do
    validates_format_of :password, with: valid_password_regex, message: 'is invalid. Include both letters and numbers.'
    validates :nickname
    validates :first_name, format: { with: valid_name_regex, message: 'is invalid. Input full-width characters.' }
    validates :last_name, format: { with: valid_name_regex, message: 'is invalid. Input full-width characters.' }
    validates :kana_first_name,
              format: { with: valid_name_kana_regex, message: 'is invalid. Input full-width katakana characters.' }
    validates :kana_last_name,
              format: { with: valid_name_kana_regex, message: 'is invalid. Input full-width katakana characters.' }
    validates :birthday
  end
end
