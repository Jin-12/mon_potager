require 'faker'
require 'geocoder'

Faker::Config.locale = 'fr'
I18n.reload!

User.create(email: "kiko@kiko.com",
	birthdate: Date.new(1958, 3, 13),
	description: "un humble serviteur",
	password: "kikokiko",
	first_name: "Nicolas",
	last_name: "Lucchetta")
User.create(email: "clem@clem.com",
	birthdate: Date.new(1958, 3, 13),
	description: "un humble penseur",
	password: "clemclem",
	first_name: "Clement",
	last_name: "Kuzniewycz")
User.create(email: "aurel@aurel.com",
	birthdate: Date.new(1958, 3, 13),
	description: "un humble designer",
	password: "aurelaurel",
	first_name: "Aurelien",
	last_name: "Verschueren")
User.create(email: "jul@jul.com",
	birthdate: Date.new(1958, 3, 13),
	description: "bun humble analyste",
	password: "juljul",
	first_name: "Jules",
	last_name: "Couturaud")
User.create(email: "cam@cam.com",
	birthdate: Date.new(1958, 3, 13),
	description: "une humble marketeuse",
	password: "camcam",
	first_name: "Camille",
	last_name: "Bideaux")
User.create(email: "oliv@oliv.com",
	birthdate: Date.new(1958, 3, 13),
	description: "une force tranquille",
	password: "olivoliv",
	first_name: "Olivier",
	last_name: "Cardinaux")

Status.create(user_id: 1,
	content: "Ca s'affiche?")
Status.create(user_id: 2,
	content: "Mais oui tu t'affiches")
Status.create(user_id: 3,
	content: "Arretez de vous afficher")

Garden.create(name: "Kikotager",
	adress: "15, avenue Secrétan Paris",
	city: "Paris",
	zipcode: "75019",
	user_id: 1,
	latitude: 48.882132,
	longitude: 2.3696279)
Garden.create(name: "Porte des lilas",
	adress: "10 rue de la verrerie",
	city: "Paris",
	zipcode: "75001",
	user_id: 2)
Garden.create(name: "Nation Potager",
	adress: "10 avenue philippe Auguste",
	city: "Paris",
	zipcode: "75011",
	country: "France",
	user_id: 3)
Garden.create(name: "94ger",
	adress: "10 rue poissoniere",
	city: "Paris",
	zipcode: "75009",
	country: "France",
	user_id: 4)
Garden.create(name: "Opotager",
	adress: "Rue des 3 Frères",
	city: "Paris",
	zipcode: "75018",
	country: "France",
	user_id: 5)
Garden.create(name: "Potamille",
	adress: "17 rue pierre Semard",
	city: "Paris",
	zipcode: "75020",
	country: "France",
	user_id: 6)
Garden.create(name: "Potacent",
	adress: "via fornacci",
	city: "Sernaglia",
	zipcode: "31020",
	country: "Italy",
	user_id: 6)

50.times do |t|
	geocity = Faker::Address.city
	coordinates = Geocoder.search(geocity).first.coordinates
	geocode = Geocoder.search(geocity).first.postal_code
	g = Garden.create(name: Faker::Cannabis.buzzword,
	adress: Faker::Address.street_address,
	city: Faker::Address.city,
	zipcode: geocode,
	country: "France",
	user_id: rand(1...6),
	latitude: coordinates[0],
	longitude: coordinates[1])
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
