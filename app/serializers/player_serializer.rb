class PlayerSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :club, dependent: :destroy
  belongs_to :match, dependent: :destroy
  attributes  :name, :number, :kind, :country, :age,  :club_id, :match_id

end
