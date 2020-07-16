class MatchSerializer < ActiveModel::Serializer
  has_many :players
  has_many :clubs, through: :players
  attributes :date, :status,  :home_team_score, :away_team_score, :home_team_system, :home_team_badge, :away_team_badge, :away_team_system, :home_team_name, :away_team_name, :home_team_badge, :away_team_badge, :id
end
