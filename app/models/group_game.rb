class GroupGame < ApplicationRecord
	belongs_to :game_group
	belongs_to :bgg_game
end
