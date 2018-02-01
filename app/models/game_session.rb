class GameSession < ApplicationRecord
	has_many :player_scores
	has_many :players, through: :player_scores

	belongs_to :game_group

	def high_score
		player_score = nil
		score = 0

		player_scores.each do |ps|
			if ps.score > score
				player_score = ps
				score = ps.score
			end
		end

		player_score
	end

	def winner
		high_score.player
	end
end
