# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# puts 'Cleaning Database...'
# Cat.destroy_all

puts 'Creating cats...'
10.times do
  cat = Cat.create(
    name: Faker::Creature::Cat.name,
    breed: Faker::Creature::Cat.breed,
    age: rand(1..11),
    description: Faker::Creature::Cat.registry,
    user: User.last
  )
  puts "Created #{cat.name}"
end
puts "Finished creating cats"
