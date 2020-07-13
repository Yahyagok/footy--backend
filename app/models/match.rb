class Match < ApplicationRecord
    has_many :players
    has_many :clubs, through: :players
end
