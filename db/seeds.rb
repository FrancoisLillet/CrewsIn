# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

puts "How many instances of users do you want to create?"
number = gets.chomp.to_i

puts "------------------------------"
puts "|        START SEEDING       |"
puts "------------------------------"

# Users

puts "Creating fake users"
puts "___________________"

number.times do
  user = User.new(email: Faker::Internet.email, password: "123456", nautical_bio: Faker::Quotes::Shakespeare.hamlet_quote)
  user.save!
end


# Experiences

puts "Creating fake experiences"
puts "___________________"

sailing_area_examples = ["Eolian Islands", "Dalmatia", "Brittany", "Corsica", "Antilles", "Polynesia"]
possible_roles = ["skipper", "co-skipper", "active mate", "passenger"]
possible_boat_types = ["sailing monohull", "sailing catamaran", "motor yacht", "motor catamaran", "RIB"]
possible_owners = ["me", "a friend / family member", "a boat renter"]
example_models = ["Lagoon 450", "Oceanis 51.1", "Sun Odyssey 349", "OVNI 400", "RM 1270", "Ferreti 62", "Princess 58"]

User.all.each do |user|
  rand(0..5).times do
    start_date = Faker::Date.in_date_period(year: rand(2005..2022))
    experience = Experience.new( {
      user_id: user.id, country: Faker::Address.country, sailing_area: sailing_area_examples.sample,
      start_date: start_date, end_date: (start_date + rand(7..21)), role: possible_roles.sample, number_of_miles: rand(50..450), boat_type: possible_boat_types.sample, boat_length: rand(20..70),
      boat_model: example_models.sample, boat_owner: possible_owners.sample
    })
    experience.save!
  end
end


# Mates

puts "Creating fake mates"
puts "___________________"

User.all.each do |user|
  rand(2..5).times do
    mate = Mate.new(
      user_id: user.id, is_user: [true, false].sample, first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, date_of_birth: Faker::Date.in_date_period(year: rand(1638..2000)),
      address: Faker::Address.full_address, nationality: Faker::Address.country, country_of_residence: Faker::Address.country, passport_number: Faker::IDNumber.valid,
      expiration_date: Faker::Date.in_date_period(year: rand(2022..2040)), phone_number: Faker::PhoneNumber.phone_number_with_country_code
    )
    mate.save!
  end
end

# Trips

puts "Creating fake trips"
puts "___________________"

User.all.each do |user|
  rand(0..5).times do
    start_date = Faker::Date.in_date_period(year: rand(2022..2023))
    trip = Trip.new(
      country: Faker::Address.country, start_date: start_date, end_date: (start_date + rand(7..21)), starting_point: Faker::Address.full_address,
      skipper_id: user.id, max_capacity: rand(6..10), creator_id: user.id
    )
    trip.save!
  end
end

# Invitations

puts "Creating fake invitations"
puts "___________________"

User.all.each do |user|
  unless user.created_trips.empty?
    rand(2..5).times do
      receiver = User.new(email: Faker::Internet.email, password: "123456", nautical_bio: Faker::Quotes::Shakespeare.hamlet_quote)
      receiver.save!
      invitation = Invitation.new(sender_id: user.id, receiver_id: receiver.id, trip_id: user.created_trips.sample.id)
      invitation.save!
    end
  end
end

# Enrollments

puts "Creating fake enrollments"
puts "___________________"

User.all.each do |user|
  unless user.created_trips.empty? || user.mates.empty?
    trip = user.created_trips.sample
    user.mates.each do |mate|
      unless mate == user.mates.last
        enrollment = Enrollment.new(mate_id: mate.id, trip_id: trip.id)
        enrollment.save!
      end
    end
  end
end

User.first.email = "123@123.com"
User.first.password = "123123"

puts "------------------------------"
puts "|      SEEDING FINISHED!     |"
puts "------------------------------"
puts ""
puts ""
puts "Your test credentials are:"
puts "------------------------------"
puts "login:       #{User.first.email}"
puts "password:    123123"
puts ""
puts "Enjoying your Crewsin !"
