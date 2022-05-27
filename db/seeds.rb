require 'faker'
require "open-uri"
require "uri"

puts 'Creating seeds...'

puts "Cleaning DB"
Booking.destroy_all
Furniture.destroy_all
User.destroy_all
puts "DB cleaned"

user1 = User.new(
  first_name: "Sylvie",
  last_name: "Nolan",
  email: "sylvie.nolan@laposte.net",
  password: "sylviiie"
)
user2 = User.new(
  first_name: "Georges",
  last_name: "Bondel",
  email: "georges.bondel@yahoo.fr",
  password: "georgio"
)
user1.save!
user2.save!

randomize_user = [user1, user2]


furnitures = [
  {
    description: "A clean look that’s easy to like and mix with other styles, either supporting a desk or standing alone. The back is finished so you can place it in the middle of the room – all sides are just as beautiful.",
    price_per_day: rand(1..10),
    name: "couch",
    city: "Paris"
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: rand(1..10),
    name: "couch",
    city: "Paris"
  },
  {
    description: "A clean look that’s easy to like and mix with other styles, either supporting a desk or standing alone. The back is finished so you can place it in the middle of the room – all sides are just as beautiful.",
    price_per_day: rand(1..10),
    name: "chair",
    city: "Paris"
  },
  {
    description: "This stackable, 3-legged stool with bent legs and triangular-shaped seat is a great little accent that’s comes in handy when you need extra seating for guests or a place to unload your cup of coffee or tea!",
    price_per_day: rand(1..10),
    name: "table",
    city: "Paris"
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: rand(1..10),
    name: "stool",
    city: "Paris"
  },
  {
    description: "Comfy seating throughout the home gives a relaxed feel – and with airy PELLO armchair you can easily create your comfort zones everywhere. The secrets are good back support and a slightly resilient frame!",
    price_per_day: rand(1..10),
    name: "sofa",
    city: "Paris"
  },
  {
    description: "Comfy seating throughout the home gives a relaxed feel – and with airy PELLO armchair you can easily create your comfort zones everywhere. The secrets are good back support and a slightly resilient frame!",
    price_per_day: rand(1..10),
    name: "chair",
    city: "Paris"
  },
  {
    description: "Sleeper sofa offers around-the-clock comfort. The adjustable back allows you to sit during the day, lean back in the evening and lie down at night. The Vissle gray cover fits in just about anywhere.",
    price_per_day: rand(1..10),
    name: "drawer",
    city: "Paris"
  },
  {
    description: "A clean expression that fits right in, in the bedroom or wherever you place it. Smooth-running drawers and in a choice of finishes – pick your favorite. Psst! Please attach to the wall.",
    price_per_day: rand(1..10),
    name: "cupboard",
    city: "Paris"
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: rand(1..10),
    name: "sofa",
    city: "Paris"
  },
  {
    description: "Comfy seating throughout the home gives a relaxed feel – and with airy PELLO armchair you can easily create your comfort zones everywhere. The secrets are good back support and a slightly resilient frame!",
    price_per_day: rand(1..10),
    name: "lamp",
    city: "Bordeaux"
  },
  {
    description: "This table for 4 blends a warm wood expression with sturdy metal in a slim design that’s pleasing to the eye even in smaller spaces. Pair it with SANDSBERG chair to create a welcoming and coordinated look.",
    price_per_day: rand(1..10),
    name: "couch",
    city: "Bordeaux"
  },
  {
    description: "This stackable, 3-legged stool with bent legs and triangular-shaped seat is a great little accent that’s comes in handy when you need extra seating for guests or a place to unload your cup of coffee or tea!",
    price_per_day: rand(1..10),
    name: "sofa",
    city: "Bordeaux"
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: rand(1..10),
    name: "couch",
    city: "Bordeaux"
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: rand(1..10),
    name: "armchair",
    city: "Bordeaux"
  },
  {
    description: "A clean look that’s easy to like and mix with other styles, either supporting a desk or standing alone. The back is finished so you can place it in the middle of the room – all sides are just as beautiful.",
    price_per_day: rand(1..10),
    name: "lamp",
    city: "Bordeaux"
  },
  {
    description: "This table for 4 blends a warm wood expression with sturdy metal in a slim design that’s pleasing to the eye even in smaller spaces. Pair it with SANDSBERG chair to create a welcoming and coordinated look.",
    price_per_day: rand(1..10),
    name: "shelf",
    city: "Bordeaux"
  },
  {
    description: "Comfy seating throughout the home gives a relaxed feel – and with airy PELLO armchair you can easily create your comfort zones everywhere. The secrets are good back support and a slightly resilient frame!",
    price_per_day: rand(1..10),
    name: "rug",
    city: "Bordeaux"
  },
  {
    description: "Sleeper sofa offers around-the-clock comfort. The adjustable back allows you to sit during the day, lean back in the evening and lie down at night. The Vissle gray cover fits in just about anywhere.",
    price_per_day: rand(1..10),
    name: "armchair",
    city: "Bordeaux"
  },
  {
    description: "This stackable, 3-legged stool with bent legs and triangular-shaped seat is a great little accent that’s comes in handy when you need extra seating for guests or a place to unload your cup of coffee or tea!",
    price_per_day: rand(1..10),
    name: "oven",
    city: "Bordeaux"
  },
  {
    description: "A clean design with solid wood veneer. Place the bed on its own or with the headboard against a wall. If you need space for extra bedding, add MALM bed storage boxes on casters.",
    price_per_day: rand(1..10),
    name: "couch",
    city: "Bordeaux"
  },
  {
    description: "The black stainless steel and space-saving design set the tone in the kitchen. There are many options to tailor the space inside for easy access and a good overview, putting an end to food waste at home.",
    price_per_day: rand(1..10),
    name: "chair",
    city: "Paris"
  },
  {
    description: "This oven offers all the basic functions you need, including the convenience of self-clean. A look that fits right in and a smooth surface for easy cleaning.",
    price_per_day: rand(1..10),
    name: "drawer",
    city: "Bordeaux"
  }
]
puts 'furnitures ?'
furnitures.each do |furniture|
  fur = Furniture.new(furniture)
  fur.user = randomize_user.sample
  uri = "?" + furniture[:name]
  file1 = { io: URI.open("https://source.unsplash.com/random/" + uri), filename: "furniture", content_type: "image/png" }
  sleep(1)
  file2 = { io: URI.open("https://source.unsplash.com/random/" + uri), filename: "furniture", content_type: "image/png" }
  sleep(1)
  file3 = { io: URI.open("https://source.unsplash.com/random/" + uri), filename: "furniture", content_type: "image/png" }
  fur.photos.attach([file1, file2, file3])
  fur.save!
end

puts "furnitures done"

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
