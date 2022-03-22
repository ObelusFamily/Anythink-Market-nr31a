require 'faker'

# Users
(1..100).each do
  user = User.where(
      email: Faker::Internet.unique.email,
      username: Faker::Internet.unique.username(specifier: 5..10, separators: ''),
      image: Faker::Avatar.image,
      bio: Faker::Lorem.unique.sentence,
    ).first_or_create

  user.password = Faker::Internet.unique.password(min_length: 8)
  user.save!
end

# Items
(1..100).each do
  random_user = User.all.sample
  item = Item.where(
    title: Faker::Movie.unique.title,
    description: Faker::Movie.quote,
    image: Faker::LoremFlickr.image,
    user: random_user
  ).first_or_create

  Comment.where(
    body: Faker::Lorem.unique.sentence,
    user: User.all.sample,
    item: item
  ).first_or_create
end

# Result
puts "Users: #{User.count}"
puts "Items: #{Item.count}"
puts "Comments: #{Comment.count}"
