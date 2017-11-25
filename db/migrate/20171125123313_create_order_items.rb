class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :delivery_order, foreign_key: true
      t.references :meal, foreign_key: true
      t.integer :quantity
      t.integer :unit_price

    end
  end
end