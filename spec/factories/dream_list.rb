FactoryBot.define do
  factory :dream_list do
    dream { 'hogehoge' }
    countdown { Faker::String.random }
    category { 'hoge' }
    association :user
  end
end
