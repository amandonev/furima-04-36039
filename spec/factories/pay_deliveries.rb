FactoryBot.define do
  factory :pay_delivery do
    token              { 'tok_abcdefghijk00000000000000000' }
    postal_code        { '123-4567' }
    prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    city               { 'テスト市' }
    address            { 'テスト区1-2' }
    building           { 'テストビル' }
    phone_number       { '09012345678' } # 11桁半角
  end

  # association :user_id, :item_id
end
