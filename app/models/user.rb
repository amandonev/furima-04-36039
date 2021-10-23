class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates_format_of :password, with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/
  validates :email,               presence: true
  validates :encrypted_password,  presence: true
  validates :nick_name,           presence: true
  validates :first_name,          presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name,           presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana,      presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_date,          presence: true

  # has_many :items
  # has_many :pays
end
