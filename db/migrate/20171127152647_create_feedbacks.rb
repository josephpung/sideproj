class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.references :ratable_id, polymorphic: true
      t.string :ratable_type
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end
