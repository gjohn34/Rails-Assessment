# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([{
  email: "test1@test.com",
  password: "password",
  password_confirmation: "password"
},
{
  email: "test2@test.com",
  password: "password",
  password_confirmation: "password"
},
{
  email: "test3@test.com",
  password: "password",
  password_confirmation: "password"
},
{
  email: "test4@test.com",
  password: "password",
  password_confirmation: "password"
  }])

Interest.create!([{
  interest: "Cats"
},
{
  interest: "Dogs"
},
{
  interest: "Fish"
},
{
  interest: "Fridges"
  }])




[
  {
    name: "John Smith",
    bio: "I am John Smith",
    user_id: 1
  },
  {
    name: "Alex Jones",
    bio: "They're turning the freaking frogs gay",
    user_id: 2
  },
  {
    name: "Tom Green",
    bio: "I am Tom Green",
    user_id: 3
  }
].each do |profile|
  resource = Profile.new(name: profile[:name], bio: profile[:bio], user_id: profile[:user_id])
  resource.pic.attach(io: File.open(Rails.root.join("app", "assets", "images", "anon.png")), filename: 'anon.png', content_type: "image/png")
  resource.save
end

profile = Profile.all
profile.each do |profile|
  Like.create!(profile_id: profile.id)
end

puts User.all.count
puts Interest.all.count
puts Profile.all.count
