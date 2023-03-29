puts 'Seeding ...'

# seed Author
author1 = Author.create!(name: 'Dan Little', email: 'dan@mail', password: "dan123", confirm_password: 'dan123')
author2 = Author.create!(name: 'Alice Walton', email: 'alice@mail', password: "alice123", confirm_password: 'alice123')
author3 = Author.create!(name: 'Brook Saward', email: 'brook@mail', password: "brook123", confirm_password: 'brook123')
author4 = Author.create!(name: 'Garry Tewari', email: 'garry@mail', password: "garry123", confirm_password: 'garry123')
author5 = Author.create!(name: 'Kerry Pit', email: 'kerry@mail', password: "kerry123", confirm_password: 'kerry123')

# Seed articles
article1 = Article.create!( title: 'How to Make a Perfect Cup of Coffee', description: 'Learn the secrets to making a delicious cup of coffee at home.', image: 'https://example.com/images/coffee.png', category: 'Food & Drink', author_id: author1.id )
article2 = Article.create!( title: 'The Benefits of Meditation', description: 'Discover how meditation can improve your mental health and well-being.', image: 'https://example.com/images/meditation.png', category: 'Self Improvement', author_id: author2.id )
article3 = Article.create!( title: '10 Must-Visit Destinations for Nature Lovers', description: 'Explore some of the world\'s most beautiful natural wonders.', image: 'https://example.com/images/nature.png', category: 'Travel', author_id: author3.id )
article4 = Article.create!( title: 'The Future of Artificial Intelligence', description: 'Get a glimpse into the exciting world of AI and its potential impact on society.', image: 'https://example.com/images/ai.png', category: 'Technology', author_id: author4.id)
article5 = Article.create!( title: '5 Simple Exercises to Improve Posture', description: 'Say goodbye to back pain and improve your posture with these easy exercises.', image: 'https://example.com/images/posture.png', category: 'Fitness', author_id: author5.id )
  



puts '✅ Done Seeding'