10.times do
User.create(first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            email: Faker::Internet.email,
            password: '123'


)
end

20.times do
  user = User.all.sample
Idea.create({ title: Faker::RickAndMorty.quote,
              body: Faker::Hipster.paragraph(50),
              likes: rand(500),
              author: Faker::Name.title,
              user_id: user.id
              })
end

ideas = Idea.all
  ideas.each do |i|
    rand(0..6).times do
      user = User.all.sample
      i.reviews.create({
        body: Faker::Lorem.paragraph(8, false, 5),
        user_id: user.id
        })
    end
  end

  reviews_count = Review.count

 # 50.times do
 # Comment.create({ user: Faker::Name.title,
 #                   body: Faker::ChuckNorris.fact,
 #                })
 # end



# puts "Comments Created"
puts "Posts Created"
puts "User Created"
# puts "Reviews Created"
