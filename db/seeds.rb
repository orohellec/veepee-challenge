# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

AdminUser.delete_all
Product.delete_all
ProductField.delete_all
ProductType.delete_all
User.delete_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
puts '1 admin user created'

product_type_1 = ProductType.create!(name: 'livre')
product_type_2 = ProductType.create!(name: 'console')

ProductField.create!(name: "auteur", required: false, field_type: 'text_field', product_type_id: product_type_1.id)
ProductField.create!(name: "portable", required: false, field_type: 'check_box', product_type_id: product_type_2.id)

15.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)

  rand(1..5).times do
    Product.create!(name: Faker::Commerce.product_name, price: rand(100..10000), user_id: user.id, product_type_id: product_type_1.id, properties: {auteur: Faker::Name.name} )
    Product.create!(name: Faker::Commerce.product_name, price: rand(100..10000), user_id: user.id, product_type_id: product_type_2.id, properties: {portable: 0} )
  end
end


