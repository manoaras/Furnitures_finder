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
end

furnitures = [
  {
    description: "A clean look that’s easy to like and mix with other styles, either supporting a desk or standing alone. The back is finished so you can place it in the middle of the room – all sides are just as beautiful.",
    price_per_day: 826,
    name: "drawers",
    user_id: 1,
    city: "Eliseochester"
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: 110,
    name: "couch",
    user_id: 1,
    city: "Antonioland"
  },
  {
    description: "A clean look that’s easy to like and mix with other styles, either supporting a desk or standing alone. The back is finished so you can place it in the middle of the room – all sides are just as beautiful.",
    price_per_day: 692,
    name: "drawers",
    user_id: 1,
    city: "Ginoside"
  },
  {
    description: "This stackable, 3-legged stool with bent legs and triangular-shaped seat is a great little accent that’s comes in handy when you need extra seating for guests or a place to unload your cup of coffee or tea!",
    price_per_day: 702,
    name: "stool",
    user_id: 1,
    city: "Mauroland"
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: 112,
    name: "sofa",
    user_id: 1,
    city: "North Derick"
  },
  {
    description: "Comfy seating throughout the home gives a relaxed feel – and with airy PELLO armchair you can easily create your comfort zones everywhere. The secrets are good back support and a slightly resilient frame!",
    price_per_day: 979,
    name: "chair",
    user_id: 1,
    city: "Erdmanfort"
  },
  {
    description: "Comfy seating throughout the home gives a relaxed feel – and with airy PELLO armchair you can easily create your comfort zones everywhere. The secrets are good back support and a slightly resilient frame!",
    price_per_day: 116,
    name: "chair",
    user_id: 1,
    city: "Port Nanci"
  },
  {
    description: "Sleeper sofa offers around-the-clock comfort. The adjustable back allows you to sit during the day, lean back in the evening and lie down at night. The Vissle gray cover fits in just about anywhere.",
    price_per_day: 244,
    name: "futon",
    user_id: 1,
    city: "Port Annalisamouth"
  },
  {
    description: "A clean expression that fits right in, in the bedroom or wherever you place it. Smooth-running drawers and in a choice of finishes – pick your favorite. Psst! Please attach to the wall.",
    price_per_day: 99,
    name: "dresser",
    user_id: 1,
    city: "Reillyside"
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: 655,
    name: "sofa",
    user_id: 1,
    city: "Alexanderborough"
  },
  {
    description: "Comfy seating throughout the home gives a relaxed feel – and with airy PELLO armchair you can easily create your comfort zones everywhere. The secrets are good back support and a slightly resilient frame!",
    price_per_day: 839,
    name: "chair",
    user_id: 2,
    city: "Chuntown"
  },
  {
    description: "This table for 4 blends a warm wood expression with sturdy metal in a slim design that’s pleasing to the eye even in smaller spaces. Pair it with SANDSBERG chair to create a welcoming and coordinated look.",
    price_per_day: 721,
    name: "table",
    user_id: 2,
    city: "Lake Kendra"
  },
  {
    description: "This stackable, 3-legged stool with bent legs and triangular-shaped seat is a great little accent that’s comes in handy when you need extra seating for guests or a place to unload your cup of coffee or tea!",
    price_per_day: 476,
    name: "stool",
    user_id: 2,
    city: "Spinkaland"
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: 763,
    name: "couch",
    user_id: 2,
    city: "Luisfort"
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: 129,
    name: "armchair",
    user_id: 2,
    city: "East Mark"
  },
  {
    description: "A clean look that’s easy to like and mix with other styles, either supporting a desk or standing alone. The back is finished so you can place it in the middle of the room – all sides are just as beautiful.",
    price_per_day: 357,
    name: "drawers",
    user_id: 2,
    city: "Koelpintown"
  },
  {
    description: "This table for 4 blends a warm wood expression with sturdy metal in a slim design that’s pleasing to the eye even in smaller spaces. Pair it with SANDSBERG chair to create a welcoming and coordinated look.",
    price_per_day: 385,
    name: "table",
    user_id: 2,
    city: "Lake Ferdinandport"
  },
  {
    description: "Comfy seating throughout the home gives a relaxed feel – and with airy PELLO armchair you can easily create your comfort zones everywhere. The secrets are good back support and a slightly resilient frame!",
    price_per_day: 575,
    name: "armchair",
    user_id: 2,
    city: "Zeldabury"
  },
  {
    description: "Sleeper sofa offers around-the-clock comfort. The adjustable back allows you to sit during the day, lean back in the evening and lie down at night. The Vissle gray cover fits in just about anywhere.",
    price_per_day: 999,
    name: "futon",
    user_id: 2,
    city: "Port Deandrehaven"
  },
  {
    description: "This stackable, 3-legged stool with bent legs and triangular-shaped seat is a great little accent that’s comes in handy when you need extra seating for guests or a place to unload your cup of coffee or tea!",
    price_per_day: 780,
    name: "stool",
    user_id: 2,
    city: "Yundtton"
  },
  {
    description: "A clean design with solid wood veneer. Place the bed on its own or with the headboard against a wall. If you need space for extra bedding, add MALM bed storage boxes on casters.",
    price_per_day: 180,
    name: "wool bed",
    user_id: 2,
    city: "Paris"
  }
]

furnitures.each do |furniture|
  Furniture.new(furniture).save!
end

start_date = Date.today - 1
end_date = Date.today + 1

Booking.create!(
  total_price: Furniture.last.price_per_day * (end_date - start_date).to_i,
  start_date: start_date,
  end_date: end_date,
  user_id: User.last.id,
  furniture_id: Furniture.last.id
)

puts 'Seeds created!'
