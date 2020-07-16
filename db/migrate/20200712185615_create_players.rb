class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :number
      t.string :kind
      t.string :country
      t.integer :age
      t.integer :match_id
      t.integer :club_id

      t.timestamps
    end
  end
end
