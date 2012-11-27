class CreateQstnVotes < ActiveRecord::Migration
  def change
    create_table :qstn_votes do |t|
      t.integer :vote_cnt
      t.integer :user_id
      t.integer :question_id

      t.timestamps
    end
  end
end
