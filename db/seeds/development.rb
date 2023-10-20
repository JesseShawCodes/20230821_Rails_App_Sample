puts "development seed data"


require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'user_dataset.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
100.times do |row|
  u = User.new
  u.password = 'password'
  u.password_confirmation = 'password'
  u.last_name = Faker::Name.last_name
  u.first_name = Faker::Name.first_name
  u.email = Faker::Internet.email


  if rand(0..1) == 1
    u.admin!
  end

  u.save!

  puts "User #{u.id} saved!"
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'address_dataset.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

100.times do |index|

  Address.create(
    street: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip,
    country: "USA",
    user: User.find(index + 1) 
  ) 
end

# Create Categories
Category.create(name: "Manga")
Category.create(name: "Journal")
Category.create(name: "Tabloid")
Category.create(name: "Fanfic")
Category.create(name: "Movie Review")


csv_text = File.read(Rails.root.join('lib', 'seeds', 'posts_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
50.times do |row|
  p = Post.new
  p.title = Faker::Lorem.sentence
  p.body = Faker::Lorem.paragraph
  p.user_id = rand(1..User.count)
  p.category_id = Faker::Number.between(from: 1, to: Category.count - 1)
  p.save!



  5.times do |y|
    Comment.create(
      body: Faker::Lorem.paragraph,
      user_id: rand(1..User.count),
      post_id: p.id
    )
  end

end

