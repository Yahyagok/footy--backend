class Club < ApplicationRecord
    has_many :players
    has_many :matches, through: :players
end
