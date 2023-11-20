services = %w[walking sitting grooming visit veterinarian]
# weekdays = %w[monday tuesday wednesday thursday friday saturday sunday]


puts "Clearing database..."
Review.destroy_all
Booking.destroy_all
Service.destroy_all
User.destroy_all

# CREER LES USERS A LA MAIN PUIS RUN rails db:seed
# puts "Creating 5 new client users..."
# 5.times do
#   User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 123456, provider: false)
# end

# puts "Creating 5 new provider users..."
# 5.times do
#   User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 123456, provider: true)
# end

puts "Creating 6 new services..."
6.times do
  Service.create!(title: services.sample, description: (Faker::Lorem.words(number: 40)).join(' '), price: rand(10..50).to_f, availabilities: "monday: 9AM - 6PM, tuesday: 9AM - 6PM, wednesday: 9AM - 6PM, thursday: 9AM - 6PM, friday: 9AM - 6PM", user: User.where(provider: true).sample, address: Faker::Address.full_address)
end

puts "Creating 10 new bookings..."
10.times do
  start_time = Time.now + rand(200000..10000000)
  Booking.create!(start_time: start_time, end_time: (start_time + 3600), user: User.where(provider: false).sample, service: Service.all.sample)
end

puts "Creating 10 new reviews..."
10.times do
  booking = Booking.all.sample
  if booking.review.nil?
    Review.create!(description: Faker::Lorem.words(number: 10).join(' '), rating: rand(1..5), user: User.where(provider: false).sample, booking: booking)
  end
end

puts "Done."
