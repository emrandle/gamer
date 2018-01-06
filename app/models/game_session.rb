class GameSession < ApplicationRecord
	has_many :player_scores, dependent: :destroy
end
