User.create!([{
  email: "johnsmith@coderacademy.com",
  password: "password",
  password_confirmation: "password"
},
{
  email: "alexjones@infowars.com",
  password: "password",
  password_confirmation: "password"
},
{
  email: "tomgreen@mousehouse.com",
  password: "password",
  password_confirmation: "password"
}])

# puts User.all.count


Interest.create!([{
  interest: "cats"
},
{
  interest: "dogs"
},
{
  interest: "fish"
},
{
  interest: "fridges"
  }])

# puts Interest.all.count



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

# puts Profile.all.count
