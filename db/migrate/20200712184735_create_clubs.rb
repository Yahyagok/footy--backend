class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :badge
      t.string :coach

      t.timestamps
    end
  end
end
