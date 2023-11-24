# Clearing database
puts "Clearing database..."
Review.destroy_all
Booking.destroy_all
Service.destroy_all
User.destroy_all
Pet.destroy_all
PetCategory.destroy_all

# Constantes pour la seed

# PetCategories
  pet_categories = ['Dog', 'Cat', 'Kangaroo', 'Rabbit', 'Ferret', 'Snake', 'Guinea Pig']

  puts "Creating pet categories..."
  pet_categories.each do |pet_category|
    PetCategory.create!(pet_category: pet_category)
  end

# Classmates
  classmates = [
    {"first_name": "Valentin", "last_name": "Baily", "picture": "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696860921/swygykduhq1mwuexaqjh.jpg"},
    {"first_name": "Sonya", "last_name": "Bouafia", "picture": "https://avatars.githubusercontent.com/u/145212672?v=4"},
    {"first_name": "Alix", "last_name": "Capely", "picture": "https://avatars.githubusercontent.com/u/147346922?v=4"},
    {"first_name": "Edward", "last_name": "Clary", "picture": "https://avatars.githubusercontent.com/u/141019228?v=4"},
    {"first_name": "Zaïra", "last_name": "Cosman", "picture": "https://avatars.githubusercontent.com/u/145020827?v=4"},
    {"first_name": "Noémie", "last_name": "Dalex", "picture": "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696797712/qik3h9h9inibxmvieofk.jpg"},
    {"first_name": "Lucas", "last_name": "de Gaetano", "picture": "https://avatars.githubusercontent.com/u/22847665?v=4"},
    {"first_name": "Lucile", "last_name": "Devilla", "picture": "https://avatars.githubusercontent.com/u/147332121?v=4"},
    {"first_name": "Laure", "last_name": "Devillers", "picture": "https://avatars.githubusercontent.com/u/121189308?v=4"},
    {"first_name": "Lara", "last_name": "El Kasm", "picture": "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696696147/oneut8ivl3cgcl4oqufv.jpg"},
    {"first_name": "Alexis", "last_name": "Dutoya", "picture": "https://avatars.githubusercontent.com/u/147279149?v=4"},
    {"first_name": "Abdeslam", "last_name": "El Mouktafi", "picture": "https://avatars.githubusercontent.com/u/138570816?v=4"},
    {"first_name": "Pierre", "last_name": "Eloy", "picture": "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696877284/nuwuv1gwamy5ze9vd3io.jpg"},
    {"first_name": "Pierre", "last_name": "Guitard", "picture": "https://avatars.githubusercontent.com/u/87818924?v=4"},
    {"first_name": "Arthur", "last_name": "Gumery", "picture": "https://avatars.githubusercontent.com/u/144789409?v=4"},
    {"first_name": "Rhita", "last_name": "Lamdouar", "picture": "https://avatars.githubusercontent.com/u/53831101?v=4"},
    {"first_name": "Louis", "last_name": "Leveque", "picture": "https://avatars.githubusercontent.com/u/147339063?v=4"},
    {"first_name": "Joana", "last_name": "Lopes", "picture": "https://avatars.githubusercontent.com/u/146979658?v=4"},
    {"first_name": "Stella", "last_name": "Ndjikessi", "picture": "https://avatars.githubusercontent.com/u/146699490?v=4"},
    {"first_name": "Romain", "last_name": "Nicault", "picture": "https://avatars.githubusercontent.com/u/9579324?v=4"},
    {"first_name": "Clément", "last_name": "Nicolas", "picture": "https://avatars.githubusercontent.com/u/144222454?v=4"},
    {"first_name": "Kim", "last_name": "Polypheme", "picture": "https://avatars.githubusercontent.com/u/145695339?v=4"},
    {"first_name": "Théodore", "last_name": "Saulnier", "picture": "https://avatars.githubusercontent.com/u/141660300?v=4"},
    {"first_name": "Abdeslam", "last_name": "Sefrioui", "picture": "https://avatars.githubusercontent.com/u/147387880?v=4"},
    {"first_name": "Ismaël", "last_name": "Sentissi", "picture": "https://avatars.githubusercontent.com/u/29755099?v=4}"},
    {"first_name": "William", "last_name": "Varsovie", "picture": "https://avatars.githubusercontent.com/u/147327995?v=4}"}
  ]

# Addresses
  addresses = ["76 Faubourg Saint Honoré, 75018", "3 rue Nationale, 75006", "19 Place de la Madeleine, 75010", "32 rue Nationale, 75006", "97 rue La Boétie, 75015", "18 rue Nationale, 75007", "3 Square de la Couronne, 75001", "51 Faubourg Saint Honoré, 750019", "8 Rue Lacretelle, 75015", "14 Avenue Marcel Proust, 75016", "234 Rue Championnet, 75018", "14 Avenue Philippe Auguste, 75011", "16 Villa Gaudelet, 75011", "13 Bd Barbès, 75018", "78 Bd Ménilmontant, 75011"]

# Bios
  abouts = ["Life's motto: pet all the dogs and spoil all the cats.",
    "Certified in purr-therapy and professional tail wagger.",
    "If I fits, I sits; if I sits, I naps – life of a cat.",
    "My pet’s Instagram has more followers than I do.",
    "Living the dream one paw print at a time.",
    "My cat’s purr is my preferred ringtone.",
    "I speak fluent doggo and catto, still learning fish.",
    "In a love triangle with my cat and dog.",
    "My life is measured in dog years and cat naps.",
    "Petting dogs and ignoring calls – a skill I excel in.",
    "If you can't find me, check under the cat.",
    "My dog's snoring is the lullaby I never knew I needed.",
    "I'm not arguing, just explaining why my pet’s right.",
    "Cats and dogs are my favorite kind of people.",
    "My pet’s hair is my favorite accessory.",
    "In my house, every chair is a cat chair.",
    "Life goal: to be as cool as my dog thinks I am.",
    "My pet's hobbies include waking me up at dawn."]

# Add users based on the classmates list
puts "Creating users..."
classmates.each do |classmate|
  user = User.create!(
    first_name: classmate[:first_name],
    last_name: classmate[:last_name],
    email: Faker::Internet.email,
    password: "123456",
    provider: [true, false].sample,
    address: addresses.sample,
    about: abouts.sample
  )
  user.profile_picture.attach(io: URI.open(classmate[:picture]), filename: 'profile.jpg')
  puts "User created!"
end

# Add pet for each user on the classmates list
User.all.each do |user|
  category = PetCategory.all.sample
  pet = Pet.create!(
    name: Faker::Creature::Animal.name,
    pet_category: PetCategory.all.sample,
    user: user
  )
  pet.pet_picture.attach(io: URI.open("https://source.unsplash.com/random/?animal"), filename: 'pet.jpg')
  puts "Pet created!"
end

# Add 2 to 7 services per service pet care provider
services = ["Boarding", "House Sitting", "Pet Walking", "Drop-In Visits", "Pet Training", "Veterinary Services", "Pet Transportation"]
puts "Creating services..."
User.where(provider: true).each do |user|
  rand(2..7).times do
    service = Service.new(
      address: addresses.sample,
      title: services.sample,
      description: Faker::Lorem.sentence,
      price: rand(10..100),
      user: user,
      availabilities: "monday: 9AM - 6PM, tuesday: 9AM - 6PM, wednesday: 9AM - 6PM, thursday: 9AM - 6PM, friday: 9AM - 6PM"
    )
    service.service_picture.attach(io: URI.open("https://source.unsplash.com/random/?pet?happy?care?veterinarian"), filename: 'service.jpg')
    service.save
    rand(2..4).times do
      ServicePetCategory.create!(pet_category: PetCategory.all.sample, service: service)
    end
    puts "Service created!"
  end
end

# Add at least two booking per user
puts "Creating bookings..."
User.all.each do |user|
  service = Service.all.sample
  start_time = Time.now - rand(1..30).days
  Booking.create!(
    start_time: Time.now - rand(1..30).days,
    end_time: (start_time + 3600),
    user: user,
    service: service
  )
  puts "Previous booking created!"
end

User.all.each do |user|
  service = Service.all.sample
  start_time = Time.now + rand(5..10).days
  Booking.create!(
    start_time: Time.now + rand(5..10).days,
    end_time: (start_time + 3600),
    user: user,
    service: service
  )
  puts "Upcoming booking created!"
end

# Assuming each provider has at least two reviews
puts "Creating reviews..."
Booking.all.each do |booking|
  rand(2..5).times do
    Review.create!(
      description: Faker::Lorem.sentence,
      rating: rand(1..5),
      user: User.where(provider: false).sample,
      booking: booking
      )
  end
  puts "Review created!"
end

puts "Done."

# puts "Creating pet categories..."
# pet_categories = ['Dog', 'Cat', 'Kangaroo', 'Rabbit', 'Ferret', 'Snake', 'Guinea Pig']

# puts "Clearing database..."
# Review.destroy_all
# Booking.destroy_all
# Service.destroy_all
# User.destroy_all
# Pet.destroy_all
# PetCategory.destroy_all

# pet_categories.each do |pet_category|
#   PetCategory.create!(pet_category: pet_category)
# end

# puts "Creating new client users with pets..."
# 5.times do
#   user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 123456, provider: false, address: Faker::Address.street_address)
#   category = PetCategory.all.sample
#   pet = Pet.create!(name: Faker::Superhero.name, pet_category: category, user: user)
#   pet.pet_picture.attach(io: File.open("#{Rails.root}/app/assets/images/pet-picture.jpg"), filename: 'pet-picture.jpg')
#   # Add a user photo in app/assets/images, THEN:
#   # => change "photo.png" to your image file name, BOTH in File.open() and filename:
#   user.profile_picture.attach(io: File.open("#{Rails.root}/app/assets/images/photo.png"), filename: 'photo.png')
# end

# puts "Creating new provider users..."
# 5.times do
#   user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 123456, provider: true, address: Faker::Address.street_address)
#   category = PetCategory.all.sample
#   pet = Pet.create!(name: Faker::Superhero.name, pet_category: category, user: user)
#   pet.pet_picture.attach(io: File.open("#{Rails.root}/app/assets/images/pet-picture.jpg"), filename: 'pet-picture.jpg')
#   # Add a user photo in app/assets/images, THEN:
#   # => change "photo.png" to your image file name, BOTH in File.open() and filename:
#   user.profile_picture.attach(io: File.open("#{Rails.root}/app/assets/images/photo.png"), filename: 'photo.png')
# end

# puts "Creating new services..."
# services = ["Boarding", "House Sitting", "Pet Walking", "Drop-In Visits", "Pet Training", "Veterinary Services", "Pet Transportation"]
# addresses = [
#   "16 Rue Clignancourt, Paris",
#   "4 Boulevard Magenta, Paris",
#   "31 Rue Mouffetard, Paris",
#   "Glacière, Paris",
#   "Arc de Triomphe, Paris",
#   "70 rue Rivoli, Paris"
# ]
# i = 0
# 6.times do
#   address = addresses[i]
#   i += 1
#   service = Service.new(title: services.sample, description: (Faker::Lorem.words(number: 40)).join(' '), price: rand(10..50).to_f, availabilities: "monday: 9AM - 6PM, tuesday: 9AM - 6PM, wednesday: 9AM - 6PM, thursday: 9AM - 6PM, friday: 9AM - 6PM", user: User.where(provider: true).sample, address: address)

#   service.service_picture.attach(io: File.open("#{Rails.root}/app/assets/images/service-photo.jpg"), filename: 'service-photo.jpg')
#   service.save
#   ServicePetCategory.create!(pet_category: PetCategory.all.sample, service: service)
#   ServicePetCategory.create!(pet_category: PetCategory.all.sample, service: service)
# end

# puts "Creating new bookings..."
# 10.times do
#   start_time = Time.now + rand(200000..10000000)
#   Booking.create!(start_time: start_time, end_time: (start_time + 3600), user: User.where(provider: false).sample, service: Service.all.sample, date: (Date.current + rand(1..60)))
# end

# puts "Creating new reviews..."
# 10.times do
#   booking = Booking.all.sample
#   if booking.review.nil?
#     Review.create!(description: Faker::Lorem.words(number: 10).join(' '), rating: rand(1..5), user: User.where(provider: false).sample, booking: booking)
#   end
# end
