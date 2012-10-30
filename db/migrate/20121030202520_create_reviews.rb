class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :text
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
    add_index :reviews, [:user_id, :book_id, :created_at]
  end
end
