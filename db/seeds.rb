# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'person_dataset.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  p = Person.new
  p.name = row['name']
  p.title = row['title']
  p.content = row['content']
  p.save

  puts "#{p.name} saved!"
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'person_dataset.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  p = Person.new
  p.name = row['name']
  p.title = row['title']
  p.content = row['content']
  p.save

  puts "#{p.name} saved!"
end


User.create(email: "dean@example.com", password: 'password', password_confirmation: "password", name: "dean", role: User.roles[:admin])

User.create(email: "Jesse@example.com", password: 'password', password_confirmation: "password", name: "Jesse")

csv_text = File.read(Rails.root.join('lib', 'seeds', 'posts_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  p = Post.new
  p.title = row['title']
  p.body = row['body']
  p.user_id = User.first.id
  p.save

  puts "Post #{p.id} saved!"

  5.times do |y|
    Comment.create(
      body: "Comment #{y}",
      user_id: User.second.id,
      post_id: p.id
    )
  end

end
