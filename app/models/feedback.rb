class Feedback < ApplicationRecord
  belongs_to :ratable_id, polymorphic: true
end
