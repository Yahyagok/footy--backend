class ReviewSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :player
  attributes :user, :player
end
