class GameGroup < ApplicationRecord
  has_many :game_sessions
  has_many :players
end
