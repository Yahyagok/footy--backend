class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :date
      t.string :status
      t.string :home_team_score
      t.string :away_team_score
      t.string :home_team_name
      t.string :away_team_name
      t.string :home_team_system
      t.string :away_team_system
      t.string :home_team_badge
      t.string :away_team_badge
   


      t.timestamps
    end
  end
end
