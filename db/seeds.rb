# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

2.times do |n|
  User.create(name: "user#{n+1}")
end
2.times do |n|
  User.create(name: "user#{n+3}",scout_email_notification: false)
end
2.times do |n|
  User.create(name: "user#{n+5}",introduction_project_email: false)
end
2.times do |n|
  User.create(name: "user#{n+7}",advertisement_delivery: false)
end
2.times do |n|
  User.create(name: "user#{n+9}",email_magazine: false)
end
2.times do |n|
  User.create(name: "user#{n+11}",contact_from_manager: false)
end