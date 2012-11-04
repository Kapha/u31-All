class AddUsernameToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :string, :string
  end
end
