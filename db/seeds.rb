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