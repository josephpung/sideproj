class OrdersController < ApplicationController
  def index
    @orders = DeliveryOrder.all
    @resultArr = []
    @orders.each do |orders|
      @resultArr.push(OrderItem.output_datetime(orders))
    end
    render json: {
      orders: @resultArr
      }
  end

  def show
    @singleOrder = DeliveryOrder.where("lower(order_id) =?", params[:id].downcase).first
    @orderItems = OrderItem.where(delivery_order_id: @singleOrder.id)
    @orderArr = []

    @orderItems.each do |item|
    @orderArr.push(OrderItem.output_mealdetails(item))
    end

    @order = OrderItem.output_datetime(@singleOrder)
    @order['order_items'] = @orderArr
    render json: @order
  end
end
