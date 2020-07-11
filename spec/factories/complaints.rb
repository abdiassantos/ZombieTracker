FactoryBot.define do
    factory :complaint do
        quantity Faker::Number.between(from: 1, to: 100)
        survivor_id Faker::Number.between(from: 1, to: 1)
    end
end