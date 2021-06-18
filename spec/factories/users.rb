FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.last_name }
    email                 { 'test@test.com' }
    password              { 'aaa111' }
    password_confirmation { password }

    first_name            { '太郎' }
    last_name             { 'フリマ' }
    kana_first_name       { 'タロウ' }
    kana_last_name        { 'フリマ' }
    birthday              { 20_000_101 }
  end
end
