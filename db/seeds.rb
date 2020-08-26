# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
2.times do |i|
s = Sub.create(name: "Sub #{i}")

s.topics.create(name: 'Topic1', body: "here is the body")
s.topics.create(name: 'Topic2', body: "here is the body")

puts 'seeded'
puts s.topics
end