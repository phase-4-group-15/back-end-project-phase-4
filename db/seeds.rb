puts 'Seeding ...'



# # seeding user
# user1 = User.create!(username: "mount", email: "mount@gmail.com", password: "mkjr12", password_confirmation: "mkjr12", bio: Faker::Quote.famous_last_words)
# user2 = User.create!(username: "elgon", email: "elgon@gmail.com", password: "JaneWandia", password_confirmation: "JaneWandia", bio: Faker::Quote.famous_last_words)
# user3 = User.create!(username: "muigai", email: "muigai@gmail.com", password: "12345", password_confirmation: "12345", bio: Faker::Quote.famous_last_words)

<<<<<<< HEAD

# seed ads
ad1 = Advertisement.create!(image: 'https://images.unsplash.com/photo-1509266272358-7701da638078?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1286&q=80', title: Faker::Book.title, genre: Faker::Book.genre, release_date: Faker::Date.forward(days: 120), user_id: user1.id )
ad2 = Advertisement.create!(image: 'https://images.unsplash.com/photo-1622567905740-74539aa99bcf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80', title: Faker::Book.title, genre: Faker::Book.genre, release_date: Faker::Date.forward(days: 90),  user_id: user1.id )
ad3 = Advertisement.create!(image: 'https://images.unsplash.com/photo-1532012197267-da84d127e765?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80', title: Faker::Book.title, genre: Faker::Book.genre, release_date: Faker::Date.forward(days: 60),  user_id: user2.id )
ad4 = Advertisement.create!(image: 'https://images.unsplash.com/photo-1476081718509-d5d0b661a376?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80', title: Faker::Book.title, genre: Faker::Book.genre, release_date: Faker::Date.forward(days: 30),  user_id: user1.id )


# Seed articles
article1 = Article.create!(likes: rand(0..100), dislikes: rand(0..100), title: 'How to Make a Perfect Cup of Coffee', description: 'Learn the secrets to making a delicious cup of coffee at home.', image: 'https://images.unsplash.com/photo-1511920170033-f8396924c348?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1587&q=80', category: 'Food & Drink', user_id: user1.id )
article2 = Article.create!(likes: rand(0..100), dislikes: rand(0..100), title: 'The Benefits of Meditation', description: 'Discover how meditation can improve your mental health and well-being.', image: 'https://images.unsplash.com/photo-1512438248247-f0f2a5a8b7f0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80', category: 'Self Improvement', user_id: user2.id )
article3 = Article.create!(likes: rand(0..100), dislikes: rand(0..100), title: '10 Must-Visit Destinations for Nature Lovers', description: 'Explore some of the world\'s most beautiful natural wonders.', image: 'https://images.unsplash.com/photo-1664351017464-56d9605e1d10?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80', category: 'Travel', user_id: user3.id )
article4 = Article.create!(likes: rand(0..100), dislikes: rand(0..100), title: 'The Future of Artificial Intelligence', description: 'Get a glimpse into the exciting world of AI and its potential impact on society.', image: 'https://plus.unsplash.com/premium_photo-1678834890210-3dd2e8443455?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80', category: 'Technology', user_id: user1.id )
article5 = Article.create!(likes: rand(0..100), dislikes: rand(0..100), title: '5 Simple Exercises to Improve Posture', description: 'Say goodbye to back pain and improve your posture with these easy exercises.', image: 'https://images.unsplash.com/photo-1585917138424-61cf3ee524d9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80', category: 'Fitness', user_id: user2.id )
=======
# # Seed articles
# article1 = Article.create!(likes: rand(0..100), dislikes: rand(0..100), title: 'How to Make a Perfect Cup of Coffee', description: 'Learn the secrets to making a delicious cup of coffee at home.', image: 'https://example.com/images/coffee.png', category: 'Food & Drink',  user_id: user1.id )
# article2 = Article.create!(likes: rand(0..100), dislikes: rand(0..100), title: 'The Benefits of Meditation', description: 'Discover how meditation can improve your mental health and well-being.', image: 'https://example.com/images/meditation.png', category: 'Self Improvement', user_id: user2.id )
# article3 = Article.create!(likes: rand(0..100), dislikes: rand(0..100), title: '10 Must-Visit Destinations for Nature Lovers', description: 'Explore some of the world\'s most beautiful natural wonders.', image: 'https://example.com/images/nature.png', category: 'Travel', user_id: user3.id )
# article4 = Article.create!(likes: rand(0..100), dislikes: rand(0..100), title: 'The Future of Artificial Intelligence', description: 'Get a glimpse into the exciting world of AI and its potential impact on society.', image: 'https://example.com/images/ai.png', category: 'Technology', user_id: user1.id )
# article5 = Article.create!(likes: rand(0..100), dislikes: rand(0..100), title: '5 Simple Exercises to Improve Posture', description: 'Say goodbye to back pain and improve your posture with these easy exercises.', image: 'https://example.com/images/posture.png', category: 'Fitness', user_id: user2.id )

# # Article.create(title: "My First Article", description: "This is my first article!", image: "https://example.com/image.png", category: "Technology", author_id: 1, user_id: 1, likes: 0, dislikes: 0)
# # Article.create(title: "My Second Article", description: "This is my second article!", image: "https://example.com/image.png", category: "Travel", author_id: 1, user_id: 1, likes: 0, dislikes: 0)
# # Article.create(title: "My Third Article", description: "This is my third article!", image: "https://example.com/image.png", category: "Fitness", author_id: 2, user_id: 2, likes: 0, dislikes: 0)
>>>>>>> Shukri-rails


# # create some reviews
# Review.create(rating: 5, comment: "Great article!", article_id: 1, user_id: 2)
# Review.create(rating: 4, comment: "Good read.", article_id: 2, user_id: 1)
# Review.create(rating: 3, comment: "Not bad.", article_id: 3, user_id: 1)
# Review.create(rating: 5, comment: "Great article!", article_id: 2, user_id: 1)
# Review.create(rating: 4, comment: "Good read.", article_id: 2, user_id: 2)
# Review.create(rating: 3, comment: "Not bad.", article_id: 1, user_id: 1)

<<<<<<< HEAD
puts '✅ Done Seeding'
=======
Advertisement.create(title: 'New Product Launch', content: 'Check out our latest product!', image: 'https://example.com/product.png', release_date: 20230401, user_id: 1)
Advertisement.create(title: 'Sale', content: '50% off all products!', image: 'https://example.com/sale.png', release_date: 20230402, user_id: 2)
Advertisement.create(title: 'Limited Time Offer', content: 'Buy one, get one free!', image: 'https://example.com/offers.png', release_date: 20230403, user_id: 1)
puts '✅ Done Seeding'
>>>>>>> Shukri-rails
