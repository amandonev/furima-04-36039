class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  # has_one :pay
  
  validates :name, :image, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_id, :price, presence: true

  validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, 
  :scheduled_id, numericality: { other_than: 1 , message: "can't be blank"}
  
  validates :price, numericality:{ less_than_or_equal_to: 300, 
    greater_than_or_equal_to: 9999999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :items_category
  belongs_to :items_status
  belongs_to :items_shipping_fee
  belongs_to :items_prefecture
  belongs_to :items_scheduled
end
