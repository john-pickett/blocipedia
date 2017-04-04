require 'wiki_data'
require 'user_data'

#Create first user
1.times do
  User.create!(
  name: "John",
  email: "john.pickett@gmail.com",
  password: "password",
  )
end
john = User.first

9.times do
  User.create!(
  name: UserData.user_name,
  email: UserData.user_email,
  password: "password"
  )
end
users = User.all

#Create Private Wikis
25.times do
  Wiki.create!(
  title: WikiData.wiki_title,
  body: WikiData.wiki_body,
  private: true,
  user: users.sample
  )
end

#Create Public Wikis
25.times do
  Wiki.create!(
  title: WikiData.wiki_title,
  body: WikiData.wiki_body,
  private: false,
  user: users.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
