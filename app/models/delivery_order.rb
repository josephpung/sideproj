class DeliveryOrder < ApplicationRecord
  validates_presence_of :order_id
  validates_presence_of :serving_datetime
  has_one :feedback, as: :ratable_id
end
