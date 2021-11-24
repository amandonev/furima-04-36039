class Delivery < ApplicationRecord
  belongs_to :pay

  # validates :postal_code, :city, :address, :phone_number,
  # presence: true

  # validates :prefecture_id,
  # numericality: { other_than: 1, message: "can't be blank" }

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :prefecture

end
