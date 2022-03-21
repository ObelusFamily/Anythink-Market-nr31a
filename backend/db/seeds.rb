require 'faker'

# Users
(1..5).each do
  user_params = Faker::Internet.user('username', 'email', 'password').merge({
    image: Faker::Avatar.image,
    bio: Faker::Quote.most_interesting_man_in_the_world
  })
  User.first_or_create(user_params)
end

# Items

(1..5).each do
  random_user = User.all.sample
  item = Item.first_or_create(
    title: Faker::Movie.title,
    description: Faker::Movie.quote,
    image: Faker::LoremFlickr.image,
    user: random_user
  )

  Comment.first_or_create(
    body: Faker::Quote.famous_last_words,
    user: User.all.sample,
    item: item
  )
end

# Result

puts "Users: #{User.count}"
puts "Items: #{Item.count}"
puts "Comments: #{Comment.count}"
