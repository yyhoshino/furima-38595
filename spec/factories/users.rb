FactoryBot.define do
  factory :user do
    name { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '優太' }
    last_name             { '星野' }
    first_name_kana       { 'ユウタ' }
    last_name_kana        { 'ホシノ' }
    birthday              { '1900-01-01' }
  end
end
