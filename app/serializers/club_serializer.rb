class ClubSerializer < ActiveModel::Serializer
  has_many :players
  has_many :matches, through: :players
  attributes :name, :badge, :coach, :players, :matches 
end
