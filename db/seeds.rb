require 'faker'
require 'geocoder'
require 'open-uri'

Faker::Config.locale = 'fr'
I18n.reload!

u = User.create(email: "kiko@kiko.com",
  birthdate: Date.new(1958, 3, 13),
  description: "un humble serviteur",
  password: "kikokiko",
  first_name: "Nicolas",
  last_name: "Lucchetta")
  dl_avatar = open("https://api.adorable.io/avatars/128/#{u.email}.png")
  u.avatar.attach(io: dl_avatar, filename: "avatar.jpg", content_type: "image/jpeg")

u = User.create(email: "clem@clem.com",
  birthdate: Date.new(1958, 3, 13),
  description: "un humble penseur",
  password: "clemclem",
  first_name: "Clement",
  last_name: "Kuzniewycz")
  dl_avatar = open("https://api.adorable.io/avatars/128/#{u.email}.png")
  u.avatar.attach(io: dl_avatar, filename: "avatar.jpg", content_type: "image/jpeg")

u = User.create(email: "aurel@aurel.com",
  birthdate: Date.new(1958, 3, 13),
  description: "un humble designer",
  password: "aurelaurel",
  first_name: "Aurelien",
  last_name: "Verschueren")
  dl_avatar = open("https://api.adorable.io/avatars/128/#{u.email}.png")
  u.avatar.attach(io: dl_avatar, filename: "avatar.jpg", content_type: "image/jpeg")

u = User.create(email: "jul@jul.com",
  birthdate: Date.new(1958, 3, 13),
  description: "bun humble analyste",
  password: "juljul",
  first_name: "Jules",
  last_name: "Couturaud")
  dl_avatar = open("https://api.adorable.io/avatars/128/#{u.email}.png")
  u.avatar.attach(io: dl_avatar, filename: "avatar.jpg", content_type: "image/jpeg")

u = User.create(email: "cam@cam.com",
  birthdate: Date.new(1958, 3, 13),
  description: "une humble marketeuse",
  password: "camcam",
  first_name: "Camille",
  last_name: "Bideaux")
  dl_avatar = open("https://api.adorable.io/avatars/128/#{u.email}.png")
  u.avatar.attach(io: dl_avatar, filename: "avatar.jpg", content_type: "image/jpeg")

u = User.create(email: "oliv@oliv.com",
  birthdate: Date.new(1958, 3, 13),
  description: "une force tranquille",
  password: "olivoliv",
  first_name: "Olivier",
  last_name: "Cardinaux")
  dl_avatar = open("https://api.adorable.io/avatars/128/#{u.email}.png")
  u.avatar.attach(io: dl_avatar, filename: "avatar.jpg", content_type: "image/jpeg")


20.times do |i|
  user =  User.create(email: "user#{i}@yopmail.com",
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          birthdate: Faker::Date.between(65.year.ago, 18.year.ago),
          description: Faker::HitchhikersGuideToTheGalaxy.quote,
          password: "password")
  dl_avatar = open("https://api.adorable.io/avatars/128/#{user.email}.png")
  user.avatar.attach(io: dl_avatar, filename: "avatar#{i}.jpg", content_type: "image/jpeg")
end

Status.create(user_id: 1,
  content: "Ca s'affiche?")
Status.create(user_id: 2,
  content: "Mais oui tu t'affiches")
Status.create(user_id: 3,
  content: "Arretez de vous afficher")

g = Garden.create(name: "Kikotager",
  adress: "15, avenue Secrétan Paris",
  city: "Paris",
  zipcode: "75019",
  user_id: 1,
  latitude: 48.882132,
  longitude: 2.3696279)
  dl_image = open(Faker::LoremFlickr.image("640x480", ['garden', 'vegetable']))
  g.images.attach(io: dl_image, filename: "image.jpg", content_type: "image/jpeg")

g = Garden.create(name: "Porte des lilas",
  adress: "10 rue de la verrerie",
  city: "Paris",
  zipcode: "75001",
  latitude: 48.482132,
  longitude: 2.6696279,
  user_id: 2)
  dl_image = open(Faker::LoremFlickr.image("640x480", ['garden', 'vegetable']))
  g.images.attach(io: dl_image, filename: "image.jpg", content_type: "image/jpeg")

g = Garden.create(name: "Nation Potager",
  adress: "10 avenue philippe Auguste",
  city: "Paris",
  zipcode: "75011",
  country: "France",
  latitude: 47.282132,
  longitude: 2.3696279,
  user_id: 3)
  dl_image = open(Faker::LoremFlickr.image("640x480", ['garden', 'vegetable']))
  g.images.attach(io: dl_image, filename: "image.jpg", content_type: "image/jpeg")

g = Garden.create(name: "94ger",
  adress: "10 rue poissoniere",
  city: "Paris",
  zipcode: "75009",
  country: "France",
  latitude: 49.482132,
  longitude: 2.0696279,
  user_id: 4)
  dl_image = open(Faker::LoremFlickr.image("640x480", ['garden', 'vegetable']))
  g.images.attach(io: dl_image, filename: "image.jpg", content_type: "image/jpeg")

g = Garden.create(name: "Opotager",
  adress: "Rue des 3 Frères",
  city: "Paris",
  zipcode: "75018",
  country: "France",
  latitude: 46.482132,
  longitude: 2.7696279,
  user_id: 5)
  dl_image = open(Faker::LoremFlickr.image("640x480", ['garden', 'vegetable']))
  g.images.attach(io: dl_image, filename: "image.jpg", content_type: "image/jpeg")

g = Garden.create(name: "Potamille",
  adress: "17 rue pierre Semard",
  city: "Paris",
  zipcode: "75020",
  country: "France",
  latitude: 45.482132,
  longitude: 1.9696279,
  user_id: 6)
  dl_image = open(Faker::LoremFlickr.image("640x480", ['garden', 'vegetable']))
  g.images.attach(io: dl_image, filename: "image.jpg", content_type: "image/jpeg")

g = Garden.create(name: "Potacent",
  adress: "via fornacci",
  city: "Sernaglia",
  zipcode: "31020",
  country: "Italy",
  latitude: 46.482132,
  longitude: 2.3696279,
  user_id: 6)
  dl_image = open(Faker::LoremFlickr.image("640x480", ['garden', 'vegetable']))
  g.images.attach(io: dl_image, filename: "image.jpg", content_type: "image/jpeg")


50.times do |t|
  geocity = Geocoder.search(Faker::Address.city).select{ |location| location.country == "France"}.first
  coordinates = geocity.coordinates
  geocode = geocity.postal_code
  geocity_name = geocity.city
  g = Garden.create(name: Faker::Cannabis.buzzword,
  adress: Faker::Address.street_address,
  city: geocity_name,
  zipcode: geocode,
  country: "France",
  user_id: rand(1...6),
  latitude: coordinates[0],
  longitude: coordinates[1])
  5.times do |t|
    Product.create(name: "   ", garden: g)
  end
  dl_image = open(Faker::LoremFlickr.image("640x480", ['garden', 'vegetable']))
  g.images.attach(io: dl_image, filename: "image.jpg", content_type: "image/jpeg")
end

Product.create(name: "Tomates", garden: Garden.all.sample)
Product.create(name: "Patates", garden: Garden.all.sample)
Product.create(name: "Melon", garden: Garden.all.sample)
Product.create(name: "Cerises", garden: Garden.all.sample)
Product.create(name: "Fraises", garden: Garden.all.sample)
Product.create(name: "Persil", garden: Garden.all.sample)
Product.create(name: "Potiron", garden: Garden.all.sample)
Product.create(name: "Navet", garden: Garden.all.sample)
Product.create(name: "Carotte", garden: Garden.all.sample)

100.times do
  Comment.create(content: Faker::Cannabis.health_benefit, user_id: User.all.sample, garden_id: Garden.all.sample)
end
