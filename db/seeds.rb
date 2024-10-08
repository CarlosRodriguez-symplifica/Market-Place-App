# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#

Product.delete_all
User.delete_all

3.times do
  user = User.create! email: Faker::Internet.email, password: 'toto123'
  puts "Created a new user: #{user.email}"

  20.times do
    published_value = [true, false].sample
    product = Product.create!(
      title: Faker::Commerce.product_name,
      price: rand(1.0..100.0),
      published: published_value,
      quantity: rand(0..100),
      user_id: user.id
    )
    puts "Created a brand new product: #{product.title}"
  end
end
