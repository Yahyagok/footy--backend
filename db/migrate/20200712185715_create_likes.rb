class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :user
      t.integer :player

      t.timestamps
    end
  end
end
