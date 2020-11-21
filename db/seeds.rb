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

['Phil', 'Tom', 'Alex', 'Jane', 'John'].each do |name|
  User.find_or_create_by!(name: name, username: name.downcase)
end

puts User.all.inspect
# Create a game purchase for each user
User.all.each do |user|
  platforms = []
  rand(0..3).times.each do
    platforms << Platform.find(rand(1..Platform.count))
  end
  platforms.uniq!

  puts GamePurchase.all.inspect
  begin
    GamePurchase.find_or_create_by!(
      user: user,
      comments: 'foo',
      platforms: platforms
    )
  rescue ActiveRecord::RecordInvalid => e
    puts "Error: #{e}"
  end
end
