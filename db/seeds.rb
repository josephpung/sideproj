# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

OrderItem.destroy_all
DeliveryOrder.destroy_all
Meal.destroy_all

10.times do
  meal = Meal.new
  meal.name = Faker::Food.dish
  meal.description = Faker::ChuckNorris.fact

  meal.save
end

5.times do
  deliveryOrder = DeliveryOrder.new
  deliveryOrder.order_id = "GA" + rand(100..200).to_s
  deliveryOrder.serving_datetime = DateTime.now
  deliveryOrder.save

  5.times do
    orderItem = OrderItem.new
    orderItem.delivery_order_id = rand(1..5)
    orderItem.meal_id = rand(1..10)
    orderItem.quantity = rand(1..3)
    orderItem.unit_price = rand(1100..3000)
    orderItem.save
  end
end
