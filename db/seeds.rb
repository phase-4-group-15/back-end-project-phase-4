puts 'Seeding ...'



# seeding user
user1 = User.create!(username: "mount", email: "mount@gmail.com", password: "mkjr12", password_confirmation: "mkjr12", bio: Faker::Quote.famous_last_words)
user2 = User.create!(username: "elgon", email: "elgon@gmail.com", password: "JaneWandia", password_confirmation: "JaneWandia", bio: Faker::Quote.famous_last_words)
user3 = User.create!(username: "muigai", email: "muigai@gmail.com", password: "12345", password_confirmation: "12345", bio: Faker::Quote.famous_last_words)

# Seed articles
article1 = Article.create!(likes: rand(0..100), dislikes: rand(0..100), title: 'How to Make a Perfect Cup of Coffee', description: 'Learn the secrets to making a delicious cup of coffee at home.', image: 'https://example.com/images/coffee.png', category: 'Food & Drink',  user_id: user1.id )
article2 = Article.create!(likes: rand(0..100), dislikes: rand(0..100), title: 'The Benefits of Meditation', description: 'Discover how meditation can improve your mental health and well-being.', image: 'https://example.com/images/meditation.png', category: 'Self Improvement', user_id: user2.id )
article3 = Article.create!(likes: rand(0..100), dislikes: rand(0..100), title: '10 Must-Visit Destinations for Nature Lovers', description: 'Explore some of the world\'s most beautiful natural wonders.', image: 'https://example.com/images/nature.png', category: 'Travel', user_id: user3.id )
article4 = Article.create!(likes: rand(0..100), dislikes: rand(0..100), title: 'The Future of Artificial Intelligence', description: 'Get a glimpse into the exciting world of AI and its potential impact on society.', image: 'https://example.com/images/ai.png', category: 'Technology', user_id: user1.id )
article5 = Article.create!(likes: rand(0..100), dislikes: rand(0..100), title: '5 Simple Exercises to Improve Posture', description: 'Say goodbye to back pain and improve your posture with these easy exercises.', image: 'https://example.com/images/posture.png', category: 'Fitness', user_id: user2.id )

# Article.create(title: "My First Article", description: "This is my first article!", image: "https://example.com/image.png", category: "Technology", author_id: 1, user_id: 1, likes: 0, dislikes: 0)
# Article.create(title: "My Second Article", description: "This is my second article!", image: "https://example.com/image.png", category: "Travel", author_id: 1, user_id: 1, likes: 0, dislikes: 0)
# Article.create(title: "My Third Article", description: "This is my third article!", image: "https://example.com/image.png", category: "Fitness", author_id: 2, user_id: 2, likes: 0, dislikes: 0)


# create some reviews
Review.create(rating: 5, comment: "Great article!", article_id: 1, user_id: 2)
Review.create(rating: 4, comment: "Good read.", article_id: 2, user_id: 1)
Review.create(rating: 3, comment: "Not bad.", article_id: 3, user_id: 1)
Review.create(rating: 5, comment: "Great article!", article_id: 2, user_id: 1)
Review.create(rating: 4, comment: "Good read.", article_id: 2, user_id: 2)
Review.create(rating: 3, comment: "Not bad.", article_id: 1, user_id: 1)

puts '✅ Done Seeding'