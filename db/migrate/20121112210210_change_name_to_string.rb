class ChangeNameToString < ActiveRecord::Migration
  def up
    change_column Topic, :name, :string
  end

  def down
  end
end
