require 'faker'
require "open-uri"
require "uri"

puts 'Creating seeds...'

puts "Cleaning DB"

Booking.destroy_all
Furniture.destroy_all
User.destroy_all

puts "DB cleaned"

puts 'Creating users'

User.create(
  first_name: "Sylvie",
  last_name: "Nolan",
  email: "sylvie.nolan@laposte.net",
  password: "sylviiie",
  avatar: "https://i.pravatar.cc/150?img=1"
)
User.create(
  first_name: "Georges",
  last_name: "Bondel",
  email: "georges.bondel@yahoo.fr",
  password: "georgio",
  avatar: "https://i.pravatar.cc/150?img=8"
)
User.create(
  first_name: "Caroline",
  last_name: "Dupont",
  email: "caroline.dpt@gmail.com",
  password: "azerty",
  avatar: "https://i.pravatar.cc/150?img=5"
)
User.create(
  first_name: "Etienne",
  last_name: "Lemarchand",
  email: "etiennelmd@gmail.com",
  password: "123456",
  avatar: "https://i.pravatar.cc/150?img=11"
)
User.create(
  first_name: "Alexandre",
  last_name: "Duverneuil",
  email: "alexdvn@gmail.com",
  password: "123456",
  avatar: "https://i.pravatar.cc/150?img=12"
)
User.create(
  first_name: "Kevin",
  last_name: "Machin",
  email: "kevdev@gmail.com",
  password: "123456",
  avatar: "https://i.pravatar.cc/150?img=14"
)
User.create(
  first_name: "Jean-Michel",
  last_name: "Cantal",
  email: "jean-michel.cantal@gmail.com",
  password: "123456",
  avatar: "https://i.pravatar.cc/150?img=17"
)
User.create(
  first_name: "Emma",
  last_name: "Proust",
  email: "emmaproust@gmail.com",
  password: "123456",
  avatar: "https://i.pravatar.cc/150?img=9"
)
User.create(
  first_name: "Brigitte",
  last_name: "Durand",
  email: "bdurand@gmail.com",
  password: "123456",
  avatar: "https://i.pravatar.cc/150?img=23"
)
User.create(
  first_name: "Elodie",
  last_name: "Roland",
  email: "elo@gmail.com",
  password: "123456",
  avatar: "https://i.pravatar.cc/150?img=28"
)
User.create(
  first_name: "ja",
  last_name: "dc",
  email: "ja.dc@gmail.com",
  password: "moviefinder",
  avatar: "https://i.pravatar.cc/150?img=52"
)

puts 'Users created'

puts 'Creating Furnitures'

furnitures = [
  {
    description: "A clean look that’s easy to like and mix with other styles, either supporting a desk or standing alone. The back is finished so you can place it in the middle of the room – all sides are just as beautiful.",
    price_per_day: 2,
    name: "Grand lit en bois de hêtre",
    genre: "Lit",
    city: "11 rue de Rivoli, Paris",
    user_id: 1
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: 1,
    name: "Canapé en cuir 2 places",
    genre: "Canapé",
    city: "140 boulevard du Montparnasse, Paris",
    user_id: 1
  },
  {
    description: "A clean look that’s easy to like and mix with other styles, either supporting a desk or standing alone. The back is finished so you can place it in the middle of the room – all sides are just as beautiful.",
    price_per_day: 1,
    name: "Lot de 2 chaises d'école rouges",
    genre: "Chaise, tabouret & banc",
    city: "53 avenue des Champs Elysées, Paris",
    user_id: 2
  },
  {
    description: "This stackable, 3-legged stool with bent legs and triangular-shaped seat is a great little accent that’s comes in handy when you need extra seating for guests or a place to unload your cup of coffee or tea!",
    price_per_day: 2,
    name: "Table basse en verre",
    genre: "Table basse",
    city: "25 rue Caulaincourt, Paris",
    user_id: 3
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: 3,
    name: "Table en bois 6 places",
    genre: "Table de salle à manger",
    city: "13 bis avenue de la Motte-Picquet, Paris",
    user_id: 4
  },
  {
    description: "Comfy seating throughout the home gives a relaxed feel – and with airy PELLO armchair you can easily create your comfort zones everywhere. The secrets are good back support and a slightly resilient frame!",
    price_per_day: 1,
    name: "Canapé gris confortable",
    genre: "Canapé",
    city: "11 rue Malar, Paris",
    user_id: 5
  },
  {
    description: "Comfy seating throughout the home gives a relaxed feel – and with airy PELLO armchair you can easily create your comfort zones everywhere. The secrets are good back support and a slightly resilient frame!",
    price_per_day: 2,
    name: "Tabouret haut de bar",
    genre: "Chaise, tabouret & banc",
    city: "25 avenue de la République, Montrouge",
    user_id: 6
  },
  {
    description: "Sleeper sofa offers around-the-clock comfort. The adjustable back allows you to sit during the day, lean back in the evening and lie down at night. The Vissle gray cover fits in just about anywhere.",
    price_per_day: 3,
    name: "Armoire en chêne massif",
    genre: "Armoire",
    city: "2 rue Boissonade, Paris",
    user_id: 7
  },
  {
    description: "A clean expression that fits right in, in the bedroom or wherever you place it. Smooth-running drawers and in a choice of finishes – pick your favorite. Psst! Please attach to the wall.",
    price_per_day: 2,
    name: "Lit 2 places avec tête de lit",
    genre: "Lit",
    city: "10 rue Daguerre, Paris",
    user_id: 8
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: 4,
    name: "Fauteuil Louis XV très bon état",
    genre: "Fauteuil",
    city: "5 rue Boulard, Paris",
    user_id: 8
  },
  {
    description: "Comfy seating throughout the home gives a relaxed feel – and with airy PELLO armchair you can easily create your comfort zones everywhere. The secrets are good back support and a slightly resilient frame!",
    price_per_day: 1,
    name: "Lampe d'architecte",
    genre: "Luminaire",
    city: "1 place de la Contrescarpe, Paris",
    user_id: 7
  },
  {
    description: "This table for 4 blends a warm wood expression with sturdy metal in a slim design that’s pleasing to the eye even in smaller spaces. Pair it with SANDSBERG chair to create a welcoming and coordinated look.",
    price_per_day: 2,
    name: "Lampe de chevet led",
    genre: "Luminaire",
    city: "65 rue de Turbigo, Paris",
    user_id: 6
  },
  {
    description: "This stackable, 3-legged stool with bent legs and triangular-shaped seat is a great little accent that’s comes in handy when you need extra seating for guests or a place to unload your cup of coffee or tea!",
    price_per_day: 4,
    name: "Bureau moderne et design",
    genre: "Bureau",
    city: "194 rue de Javel, Paris",
    user_id: 9
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: 4,
    name: "Lot de 2 tables de chevet identiques",
    genre: "Table",
    city: "3 rue Messine, Paris",
    user_id: 10
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: 5,
    name: "Tapis en peau d'ours",
    genre: "Tapis",
    city: "6 rue de la Soif, Paris",
    user_id: 10
  },
  {
    description: "A clean look that’s easy to like and mix with other styles, either supporting a desk or standing alone. The back is finished so you can place it in the middle of the room – all sides are just as beautiful.",
    price_per_day: 1,
    name: "Meuble TV ordinaire",
    genre: "Meuble TV",
    city: "4 rue Madame, Paris",
    user_id: 10
  },
  {
    description: "This table for 4 blends a warm wood expression with sturdy metal in a slim design that’s pleasing to the eye even in smaller spaces. Pair it with SANDSBERG chair to create a welcoming and coordinated look.",
    price_per_day: 5,
    name: "Bibliothèque XVIIIe vernie",
    genre: "Bibliothèque & étagère",
    city: "16 villa Gaudelet, Paris",
    user_id: 9
  },
  {
    description: "Comfy seating throughout the home gives a relaxed feel – and with airy PELLO armchair you can easily create your comfort zones everywhere. The secrets are good back support and a slightly resilient frame!",
    price_per_day: 3,
    name: "Commode Empire",
    genre: "Commode",
    city: "15 avenue du général Leclerc, Paris",
    user_id: 1
  },
  {
    description: "Sleeper sofa offers around-the-clock comfort. The adjustable back allows you to sit during the day, lean back in the evening and lie down at night. The Vissle gray cover fits in just about anywhere.",
    price_per_day: 1,
    name: "Matelas une place",
    genre: "Matelas",
    city: "3 place Vendôme, Paris",
    user_id: 2
  },
  {
    description: "This stackable, 3-legged stool with bent legs and triangular-shaped seat is a great little accent that’s comes in handy when you need extra seating for guests or a place to unload your cup of coffee or tea!",
    price_per_day: 2,
    name: "Four",
    genre: "Meuble de cuisine",
    city: "30 avenue Denfert-Rochereau, Paris",
    user_id: 3
  },
  {
    description: "A clean design with solid wood veneer. Place the bed on its own or with the headboard against a wall. If you need space for extra bedding, add MALM bed storage boxes on casters.",
    price_per_day: 1,
    name: "Fauteuil en osier",
    genre: "Fauteuil",
    city: "112 avenue Daumesnil, Paris",
    user_id: 4
  },
  {
    description: "The black stainless steel and space-saving design set the tone in the kitchen. There are many options to tailor the space inside for easy access and a good overview, putting an end to food waste at home.",
    price_per_day: 5,
    name: "Lit king size",
    genre: "Lit",
    city: "64 boulevard Saint-Germain, Paris",
    user_id: 5
  },
  {
    description: "This oven offers all the basic functions you need, including the convenience of self-clean. A look that fits right in and a smooth surface for easy cleaning.",
    price_per_day: 6,
    name: "Table marquetée XVIIe",
    genre: "Bureau",
    city: "16 rue de Tanger, Paris",
    user_id: 5
  }
]

furnitures.each do |furniture|
  fur = Furniture.new(furniture)
  file1 = { io: URI.open("https://source.unsplash.com/random/?chair"), filename: "furniture", content_type: "image/png" }
  file2 = { io: URI.open("https://source.unsplash.com/random/?table"), filename: "furniture", content_type: "image/png" }
  file3 = { io: URI.open("https://source.unsplash.com/random/?couch"), filename: "furniture", content_type: "image/png" }
  fur.photos.attach([file1, file2, file3])
  fur.save!
  puts 'ok'
end

puts 'Furnitures created'

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
