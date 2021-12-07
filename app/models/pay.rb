class Pay < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :delivery
end
