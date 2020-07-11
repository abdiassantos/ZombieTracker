FactoryBot.define do
    factory :trade do
        sender Faker::Number.between(from: 1, to: 100)
        receiver Faker::Number.between(from: 1, to: 100)
        item_id_sender Faker::Number.between(from: 1, to: 100)
        item_id_receiver Faker::Number.between(from: 1, to: 100)
        quantity_receiver Faker::Number.between(from: 1, to: 100)
        quantity_sender Faker::Number.between(from: 1, to: 100)
    end
end