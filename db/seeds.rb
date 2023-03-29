# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Seeding begins here..."


# User.create! ([
   
#     {username:"Murife",password_digest:"Murife123",email: "murife@gmail.com"}

#   ])
user1 = User.create!(username: "mount", email: "mount@gmail.com", password: "mkjr12", password_confirmation: "mkjr12")
user2 = User.create!(username: "elgon", email: "elgon@gmail.com", password: "JaneWandia", password_confirmation: "JaneWandia")
user3 = User.create!(username: "muigai", email: "muigai@gmail.com", password: "12345", password_confirmation: "12345")



  puts "Done seeding"