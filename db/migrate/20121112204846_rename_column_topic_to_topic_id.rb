class RenameColumnTopicToTopicId < ActiveRecord::Migration
  def up
    add_column Question, :name, :string
  end

  def down
    remove_column Question, :topic
  end
end
