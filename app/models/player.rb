class Player < ApplicationRecord
    belongs_to :club
    belongs_to :match
end
