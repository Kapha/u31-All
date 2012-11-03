class AddRatingToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :rating, :integer, default: 5
  end
end
