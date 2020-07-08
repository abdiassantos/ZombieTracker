# Populating the database with some survivors
10.times do
    Survivor.create({
        name: Faker::Name.name,
        age: Faker::Number.between(from: 1, to: 100), 
        gender: Faker::Gender.short_binary_type,
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude,
        infected: Faker::Boolean.boolean
    });
end

#Populating the database with some items
item1 = Item.create({
    description: "1 Fiji Water",
    value: 14
});
item2 = Item.create({
    description: "1 Campbell Soup",
    value: 12
});
item3 = Item.create({
    description: "1 First Aid Pouch",
    value: 10
});
item4 = Item.create({
    description: "1 AK47",
    value: 8
});