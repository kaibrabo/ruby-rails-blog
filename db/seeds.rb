require 'random_data'

puts "Seeding start"

# Creates 5 random users
5.times do
    User.create!(
        name:       RandomData.random_name, 
        email:      RandomData.random_email, 
        password:   RandomData.random_sentence
    )
end

# Create an admin user
admin = User.create!(
    name:     'Admin User',
    email:    'admin@test.com',
    password: 'password',
    role:     'admin'
)

puts "Admin user created"

# Create a moderator user
moderator = User.create!(
    name:     'Moderator User',
    email:    'mod@test.com',
    password: 'password',
    role:     'moderator'
)

puts "Moderator user created"
    
# Create a member
member = User.create!(
    name:     'Member User',
    email:    'member@test.com',
    password: 'password'
)

puts "Member user created"
        
users = User.all
puts "#{User.count} users created"

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
        user:   users.sample,
        topic:  topics.sample,
        title:  RandomData.random_sentence,
        body:   RandomData.random_paragraph
    )
end

# sets all post objects to 'posts' 
posts = Post.all    
puts "#{Post.count} posts created"

# Creates 100 comments
100.times do
    Comment.create!(
        user: users.sample,
        post: posts.sample,
        body: RandomData.random_paragraph
    )
    # '.sample' returns a random element from the array every time it's called.
    # we call 'sample' on the 'posts' array in order to pick a random post to associate each comment with.
end

puts "#{Comment.count} comments created"
puts "Seeding done!"



