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
csv.each do |row|
  User.create(
    email: row['email'],
    password: 'password', 
    password_confirmation: "password", 
    last_name: row['last_name'],
    first_name: row['first_name']
  ) 
  puts "User #{row} saved"
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'address_dataset.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|

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

csv_text = File.read(Rails.root.join('lib', 'seeds', 'posts_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  p = Post.new
  p.title = "#{row['title']}"
  p.body = "#{row['body']}"
  p.user_id = rand(1..User.count)
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
