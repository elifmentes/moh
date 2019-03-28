require 'faker'

20.times do |time|
  user = User.new
  user.username = Faker::Internet.username(5..15)
  user.email = Faker::Internet.email(user.username)
  user.password = Faker::Internet.password(8)
  user.name = Faker::Name.first_name
  user.surname = Faker::Name.last_name
  user.calendar = 'You will build your calendar'
  user.photo = 'You will add a photo'
  user.save
end

8.times do |time|
  business = Business.new
  business.title = Faker::Movies::HarryPotter.spell
  business.budget = rand(1..100).to_s
  business.rating = rand(1..5)
  business.location = Faker::Movies::HarryPotter.location
  business.calendar = 'You will build your calendar'
  business.photo = 'You will have your photos'
  business.owner_id = rand(1..8)
  business.save
end
