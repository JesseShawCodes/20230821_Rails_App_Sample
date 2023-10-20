puts "development seed data"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'user_dataset.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.first(100).each do |row|
  u = User.new
  u.password = 'password'
  u.password_confirmation = 'password'
  u.last_name = "#{row['last_name']}"
  u.first_name = "#{row['first_name']}"
  u.email = "#{row['email']}"
  if row['admin'] = 1 
    u.admin!
  end

  u.save!

  # lasjflksajf
  puts "User #{u.id} saved!"
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'address_dataset.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.first(100).each do |row|

  Address.create(
    street: row['street'],
    city: row['city'],
    state: row['state'],
    zip: row['zip'],
    country: "USA",
    user: User.find(row['user']) 
  ) 
  puts "Address #{row} saved"
end

# Create Categories
Category.create(name: "Manga")
Category.create(name: "Journal")
Category.create(name: "Tabloid")
Category.create(name: "Fanfic")
Category.create(name: "Movie Review")


csv_text = File.read(Rails.root.join('lib', 'seeds', 'posts_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.first(50).each do |row|
  p = Post.new
  p.title = "#{row['title']}"
  p.body = "#{row['body']}"
  p.user_id = rand(1..User.count)
  p.category_id = Faker::Number.between(from: 1, to: Category.count - 1)
  p.save!

  puts "Post #{p.id} saved!"

  5.times do |y|
    Comment.create(
      body: "Comment #{y}",
      user_id: rand(1..User.count),
      post_id: p.id
    )
  end

end

