class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :password
      t.integer :club_id

      t.timestamps
    end
  end
end
