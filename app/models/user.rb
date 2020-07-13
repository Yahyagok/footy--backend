class User < ApplicationRecord
    has_many :reviews
    has_many :players, through: :reviews
    has_many :likes
    has_many :players, through: :likes
    belongs_to :club
end
