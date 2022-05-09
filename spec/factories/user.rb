FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'abc1234' }
    password_confirmation { 'abc1234' }
  end
end
