class PlayerSerializer < ActiveModel::Serializer
  belongs_to :club
  belongs_to :match
  attributes :club, :match, :name, :number, :type, :country, :age
end
