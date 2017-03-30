require 'wiki_data'

#Create first user
1.times do
  User.create!(
  name: "John",
  email: "john.pickett@gmail.com",
  password: "password",
  )
end
john = User.first

#Create Wikis
25.times do
  Wiki.create!(
  title: WikiData.wiki_title,
  body: WikiData.wiki_body,
  private: false,
  user: john
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
