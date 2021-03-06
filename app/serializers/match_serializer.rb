class MatchSerializer
  include FastJsonapi::ObjectSerializer
  has_many :players, dependent: :destroy
  has_many :clubs, through: :players, dependent: :destroy
  attributes :date, :status,  :home_team_score, :away_team_score, :home_team_system, :home_team_badge, :away_team_badge, :away_team_system, :home_team_name, :away_team_name, :home_team_badge, :away_team_badge

end
