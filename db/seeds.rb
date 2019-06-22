require 'random_data'

puts "Seeding start"

# Creates 15 random topics
15.times do
   
    Topic.create!(
        name:           RandomData.random_sentence,
        description:    RandomData.random_paragraph
    ) 
end

topics = Topic.all

puts "#{Topic.count} topics created"

# Creates 50 random posts
50.times do
    
    Post.create!(
        topic:  topics.sample,
        title:  RandomData.random_sentence,
        body:   RandomData.random_paragraph
    )

end

puts "#{Post.count} posts created"

# sets all post objects to 'posts' 
posts = Post.all    

# Creates 100 comments
100.times do

    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
    )

    # '.sample' returns a random element from the array every time it's called.
    # we call 'sample' on the 'posts' array in order to pick a random post to associate each comment with.
end

puts "#{Comment.count} comments created"
puts "Seeding done!"



