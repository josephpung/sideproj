class OrderItem < ApplicationRecord
  belongs_to :delivery_order
  belongs_to :meal
  validates_presence_of :quantity
  has_one :feedback, as: :ratable


  def self.output_datetime(params)
    @singleOrder = DeliveryOrder.where("lower(order_id) =?", params.order_id.downcase).first
    @orderItems = OrderItem.where(delivery_order_id: @singleOrder.id)
      orderArray = []
    @orderItems.each do |item|
      indivOrderObj = {}
      indivOrderObj['name'] = Meal.find(item.meal_id).name
      orderArray.push(indivOrderObj)
    end
    newobj = {}
    newobj["id"] = params.id
    newobj["order_id"] = params.order_id
    currentTime = params.serving_datetime.strftime('%I:%M')
    endRange = params.serving_datetime + Rational("1800")
    rangeEndTime = endRange.strftime('%I:%M %p')
    newobj['delivery_date'] = params.serving_datetime.to_date
    newobj['delivery_time'] = currentTime.to_s + "-" + rangeEndTime.to_s
    newobj['feedback_submitted'] = params.feedback ? true : false
    newobj['order_items'] = orderArray

    return newobj
  end

  def self.output_mealdetails(params)
    indivOrderObj = {}
    indivOrderObj["name"] = Meal.find(params.meal_id).name
    indivOrderObj["quantity"] = params.quantity
    indivOrderObj["total_price"] = params.quantity*params.unit_price

    return indivOrderObj
  end
end
