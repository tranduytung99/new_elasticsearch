# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do |n|
  # title  = Faker::Name.title
  # text = "ex-#{n + 1}@framgia.cm"
  User.create name: "#{Faker::Name.title} - abc #{n}"
  #user.create_setting timezone_name: ActiveSupport::TimeZone.all.sample.name
end
