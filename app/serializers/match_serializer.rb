class MatchSerializer < ActiveModel::Serializer
  has_many :players
  has_many :clubs, through: :players
  attributes :date, :status,  :home_scorer, :away_scorer  :home_team_score, :away_team_score, :home_team_name, :away_team_name, :players, :clubs
end
