class ClubSerializer
  include FastJsonapi::ObjectSerializer
  has_many :players,  dependent: :destroy
  has_many :matches, through: :players, dependent: :destroy
  attributes :name, :badge

end
