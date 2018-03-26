class BggGame < ApplicationRecord
	has_many :group_games
	has_many :game_groups, through: :group_games
end