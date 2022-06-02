# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"
require "json"
require 'cat_api'

# puts 'Cleaning Database...'
# Booking.destroy_all
# Cat.destroy_all

puts 'Creating user and cats...'
5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 'superuser',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: 'stret',
    post_code: '1234',
    phone_number: '1234555'
  )
  puts "Created #{user.first_name}"
  5.times do
    client = CatAPI.new
    images = client.get_images
    image = images[0].url
    cat = Cat.create(
      name: Faker::Creature::Cat.name,
      breed: Faker::Creature::Cat.breed,
      age: rand(1..11),
      description: Faker::Creature::Cat.registry,
      user: user,
      user_id: user.id
    )
    file = URI.open(image)
    cat.photos.attach(io: file, filename: "cat.jpg", content_type: "image/png")
  end
end
puts "Finished creating user and cats"
