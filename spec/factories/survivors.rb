FactoryBot.define do
    factory :survivor do
        name Faker::Name.name
        age Faker::Number.between(from: 1, to: 100) 
        gender Faker::Gender.short_binary_type
        latitude Faker::Address.latitude
        longitude Faker::Address.longitude
        infected Faker::Boolean.boolean
    end
end