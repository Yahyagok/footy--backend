class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :user
      t.integer :player

      t.timestamps
    end
  end
end
