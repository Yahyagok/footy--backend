class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :number
      t.string :type
      t.string :country
      t.integer :age
      t.integer :match
      t.integer :club

      t.timestamps
    end
  end
end
