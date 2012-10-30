class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :author_id
      t.string :description

      t.timestamps
    end
    add_index :books,[:author_id, :created_at]
  end
end
