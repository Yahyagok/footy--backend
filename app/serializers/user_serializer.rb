class UserSerializer
  include FastJsonapi::ObjectSerializer

  has_many :reviews, dependent: :destroy
  has_many :players, through: :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :players, through: :likes, dependent: :destroy
  belongs_to :club, dependent: :destroy
  attributes :name, :password, :club_id, :reviews, :players, :likes


end
