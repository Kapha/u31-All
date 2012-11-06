class CreateReputations < ActiveRecord::Migration
  def change
    create_table :reputations do |t|
      t.integer :vote_up
      t.integer :vote_down
      t.integer :total
      t.integer :user_id
      t.integer :review_id

      t.timestamps
    end
  end
end
