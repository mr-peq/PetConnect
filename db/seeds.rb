puts "Creating pet categories..."
pet_categories = ['Dog', 'Cat', 'Kangaroo', 'Rabbit', 'Ferret', 'Snake', 'Guinea Pig']

puts "Clearing database..."
Review.destroy_all
Booking.destroy_all
Service.destroy_all
User.destroy_all
Pet.destroy_all

# pet_categories.each do |pet_category|
#   PetCategory.create!(pet_category: pet_category)
# end


# # CREER LES USERS A LA MAIN PUIS RUN rails db:seed
# puts "Creating 5 new client users with pets..."
# 5.times do
#   user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 123456, provider: false, address: Faker::Address.street_address)
#   category = PetCategory.all.sample
#   pet = Pet.create!(name: Faker::Superhero.name, pet_category: category, user: user)
#   # Add a user photo in app/assets/images, THEN:
#   # => change "photo.png" to your image file name, BOTH in File.open() and filename:
#   user.photos.attach(io: File.open("#{Rails.root}/app/assets/images/photo.png"), filename: 'photo.png')
# end

# puts "Creating 5 new provider users..."
# 5.times do
#   user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 123456, provider: true, address: Faker::Address.street_address)
#   # Add a user photo in app/assets/images, THEN:
#   # => change "photo.png" to your image file name, BOTH in File.open() and filename:
#   user.photos.attach(io: File.open("#{Rails.root}/app/assets/images/photo.png"), filename: 'photo.png')
# end

# puts "Creating 6 new services..."
# services = %w[Walking Sitting Groom Visit Veterinarian]
# 6.times do
#   service = Service.create!(title: services.sample, description: (Faker::Lorem.words(number: 40)).join(' '), price: rand(10..50).to_f, availabilities: "monday: 9AM - 6PM, tuesday: 9AM - 6PM, wednesday: 9AM - 6PM, thursday: 9AM - 6PM, friday: 9AM - 6PM", user: User.where(provider: true).sample, address: Faker::Address.street_address)
#   ServicePetCategory.create!(pet_category: PetCategory.all.sample, service: service)
#   ServicePetCategory.create!(pet_category: PetCategory.all.sample, service: service)
# end

# puts "Creating 10 new bookings..."
# 10.times do
#   start_time = Time.now + rand(200000..10000000)
#   Booking.create!(start_time: start_time, end_time: (start_time + 3600), user: User.where(provider: false).sample, service: Service.all.sample, date: (Date.current + rand(1..60)))
# end

# puts "Creating 10 new reviews..."
# 10.times do
#   booking = Booking.all.sample
#   if booking.review.nil?
#     Review.create!(description: Faker::Lorem.words(number: 10).join(' '), rating: rand(1..5), user: User.where(provider: false).sample, booking: booking)
#   end
# end

# puts "Done."
