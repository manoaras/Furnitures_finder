require 'faker'

puts 'Creating seeds...'

2.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
  )
    user.save
  10.times do
    furniture = Furniture.new(
      name: Faker::House.furniture,
      description: Faker::Lorem.sentence,
      user_id: user.id
      )
    furniture.save
  end
end

puts 'Seeds created!'
