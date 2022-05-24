require 'faker'

puts 'Creating seeds...'

puts "Cleaning DB"
Booking.destroy_all
Furniture.destroy_all
User.destroy_all
puts "DB cleaned"

2.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
  )
    user.save!
  10.times do
    furniture = Furniture.new(
      name: Faker::House.furniture,
      description: Faker::Lorem.sentence,
      user_id: user.id
      )
    furniture.save!
  end
end

Booking.create!(
  total_price: 100,
  start_date: Date.today - 1,
  end_date: Date.today + 1,
  user_id: User.last.id,
  furniture_id: Furniture.last.id
)

puts 'Seeds created!'
