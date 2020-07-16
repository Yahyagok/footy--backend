class PlayerSerializer < ActiveModel::Serializer
  belongs_to :club
  belongs_to :match
  attributes  :name, :number, :kind, :country, :age, :id, :club_id, :match_id
end
