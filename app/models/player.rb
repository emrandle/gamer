class Player < ApplicationRecord
	has_many :player_scores
	has_many :game_sessions, through: :player_scores

	belongs_to :game_group

	def game_sessions_for_year(year)
		results = []

		game_sessions.each do |session|
			results << session if session.game_date.year.eql?(year.to_i)
		end

		results
	end

	def game_sessions_for_year_group(year,group)
		results = []

		game_sessions.each do |session|
			results << session if session.game_date.year.eql?(year.to_i)
		end

		results
	end
end
