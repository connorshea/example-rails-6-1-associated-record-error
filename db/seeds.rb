# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating Game Purchases..."

['Xbox Series X', 'PlayStation 5', 'Nintendo Switch', 'Nintendo Wii', 'Windows'].each do |name|
  Platform.create!(name: name)
end

# Create 5 game purchases
5.times do
  platforms = []
  rand(0..3).times.each do
    platforms << Platform.find(rand(1..Platform.count))
  end
  platforms.uniq!

  GamePurchase.find_or_create_by!(
    comments: 'foo',
    platforms: platforms
  )
end
