FactoryBot.define do
    factory :inventory do
        quantity Faker::Number.between(from: 1, to: 1000)
        item_id Faker::Number.between(from: 1, to: 4)
        survivor_id Faker::Number.between(from: 1, to: 1) 
    end
end