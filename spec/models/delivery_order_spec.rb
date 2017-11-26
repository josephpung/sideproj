require 'rails_helper'

RSpec.describe DeliveryOrder, type: :model do
  it "is valid with valid attributes" do
     expect(DeliveryOrder.new(order_id: "GA123", serving_datetime: DateTime.now)).to be_valid
   end
   it "is not valid without a delivery order ID" do
    delivery = DeliveryOrder.new(order_id: nil)
    expect(delivery).to_not be_valid
  end
   it "is not valid without a delivery date and time" do
     delivery = DeliveryOrder.new(serving_datetime: nil)
     expect(delivery).to_not be_valid
   end
   it "is not valid without a valid delivery date and time entry" do
     delivery = DeliveryOrder.new(serving_datetime: "2234234234234")
     expect(delivery).to_not be_valid
   end
end
