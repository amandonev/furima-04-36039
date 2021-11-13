class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  # has_one :pay

  validates :name, :image, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_id, :price,
            presence: true

  validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id,
            :scheduled_id, numericality: { other_than: 1, message: "can't be blank" }

  validates :price, numericality: { less_than_or_equal_to: 9_999_999,
                                    greater_than_or_equal_to: 300 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled
end
