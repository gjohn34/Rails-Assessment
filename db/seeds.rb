# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
    bio: "I am John Smith"
  },
  {
    name: "Alex Jones",
    bio: "They're turning the freaking frogs gay"
  },
  {
    name: "Tom Green",
    bio: "I am Tom Green"
  }
].each do |profile|
  resource = Profile.new(name: profile[:name], bio: profile[:bio])
  resource.pic.attach(io: File.open(Rails.root.join("app", "assets", "images", "anon.png")), filename: 'anon.png', content_type: "image/png")
  resource.save
end
