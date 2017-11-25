class Meal < ApplicationRecord
  has_many :order_items
  validates_presence_of :name
  validates_presence_of :description
end
