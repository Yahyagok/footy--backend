class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :date
      t.string :status
      t.string :home_scorer
      t.string :away_scorer
      t.string :home_team_score
      t.string :away_team_score
      t.string :home_team_name
      t.string :away_team_name


      t.timestamps
    end
  end
end
