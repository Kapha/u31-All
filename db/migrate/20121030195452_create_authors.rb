class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :a1stname
      t.string :asurname

      t.timestamps
    end
  end
end
