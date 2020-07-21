class LikeSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :user, dependent: :destroy
  belongs_to :player, dependent: :destroy
  attributes :user, :player
end
