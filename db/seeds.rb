# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all
User.destroy_all
Review.destroy_all

puts "Creating users..."
user1 = User.create(name: Faker::Name.name)
user2 = User.create(name: Faker::Name.name)
user3 = User.create(name: Faker::Name.name)

puts "Creating products..."
product1 = Product.create(name: "Stapler", price: 10)
product2 = Product.create(name: "Whiteboard", price: 15)
product3 = Product.create(name: "Dry Erase Markers", price: 5)
product4 = Product.create(name: "Ballpoint Pens", price: 2)
product5 = Product.create(name: "Scotch Tape", price: 3)

puts "Creating reviews..."
review1 = Review.create(star_rating: 5, comment: "Love it", product_id: product1.id, user_id: user1.id)
review2 = Review.create(star_rating: 4, comment: "Like it", product_id: product2.id, user_id: user2.id)
review3 = Review.create(star_rating: 3, comment: "It's fine", product_id: product3.id, user_id: user3.id)
review4 = Review.create(star_rating: 1, comment: "Hate it", product_id: product4.id, user_id: user1.id)
review5 = Review.create(star_rating: 1, comment: "Yuck", product_id: product3.id, user_id: user3.id)

puts "Seeding done!"

# Testing
# puts
# puts review1.user.name
# puts
# puts review2.product.name
# puts 
# puts product1.reviews
# puts 
# puts product1.users
# puts
# puts user1.reviews
# puts
# puts user1.products
# puts
puts review1.print_review
puts
puts product1.leave_review(user2, 4, "Pretty cool")
puts
puts product1.print_all_reviews
puts
puts product1.average_rating
puts
puts user1.favorite_product
puts 
puts user3.remove_reviews(product3)

