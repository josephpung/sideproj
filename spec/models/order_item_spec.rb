require 'rails_helper'

RSpec.describe OrderItem, type: :model do

   meal = Meal.new(name: "test", description: "test")
   meal.save
   delivery = DeliveryOrder.new(order_id: "GA123", serving_datetime: DateTime.now)
   delivery.save

  it "is valid with valid attributes" do
     expect(OrderItem.new(delivery_order_id: 1, meal_id: 1, quantity: 1, unit_price: 2000)).to be_valid
   end
   it "is not valid without a delivery_order_id" do
    order = OrderItem.new(meal_id: 1, quantity: 1, unit_price: 2000)
    expect(order).to_not be_valid
  end
   it "is not valid without quantity" do
     delivery = OrderItem.new(delivery_order_id: 1, meal_id: 1, unit_price: 2000)
     expect(delivery).to_not be_valid
   end
end
