FactoryBot.define do
  factory :user do
    nick_name             { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { 'abc123' }
    encrypted_password    { 'abc123' }
    last_name             { '全角' }
    last_name_kana        { 'ゼンカク' }
    first_name            { '太郎' }
    first_name_kana       { 'タロウ' }
    birth_date            { '1950-01-01' }
  end
end
