class UserSerializer < ActiveModel::Serializer
  has_many :reviews
  has_many :players, through: :reviews
  has_many :likes
  has_many :players, through: :likes
  belongs_to :club
  attributes :name, :password, :club, :reviews, :players, :likes
end
