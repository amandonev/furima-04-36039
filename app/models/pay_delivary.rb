class PayDelivary
  include ActiveModel::Module
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building :phone_number, :user_id

  with_options presence: true do
    :postal_code, :city, :address, :phone_number
    :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :user_id
  end

  def save
    pay = Pay.create(pay: pay, user_id: uyser_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, pay_id: pay.id)
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end