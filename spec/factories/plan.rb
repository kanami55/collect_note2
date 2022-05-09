FactoryBot.define do
  factory :plan do
    title { Faker::Book.title }
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    association :user
  end
end
