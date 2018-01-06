namespace :gamer do
	desc 'Add in the base players'
	task :base_players => :environment do
		game_group = GameGroup.create(name: 'Beginners Mind')

		Player.create(first_name: 'Mike', last_name: 'Randle', nick_name: 'Wile E', group_id: game_group.id)
		Player.create(first_name: 'Melvin', last_name: 'Mallard', nick_name: 'Mely Mel', group_id: game_group.id)
		Player.create(first_name: 'Keith', last_name: 'Dixon', nick_name: 'KD', group_id: game_group.id)
		Player.create(first_name: 'Darius', last_name: 'Carter', nick_name: 'DC', group_id: game_group.id)
	end

	desc 'Add games'
	task :add_games => :environment do
		mike = Player.find_by(first_name: 'Mike')
		mel = Player.find_by(first_name: 'Melvin')
		keith = Player.find_by(first_name: 'Keith')
		darius = Player.find_by(first_name: 'Darius')

		gs = GameSession.create(game_date: '2017-01-28', name: 'Vasco da Gama', bgg_id: 41002)
		gs.player_scores.create([
			{player_id: mike.id, score: 34},
			{player_id: mel.id, score: 35},
			{player_id: keith.id, score: 35},
			{player_id: darius.id, score: 43}
		])

		gs = GameSession.create(game_date: '2017-20-10', name: 'Vasco da Gama', bgg_id: 41002)
		gs.player_scores.create([
			{player_id: mike.id, score: 24},
			{player_id: mel.id, score: 23},
			{player_id: keith.id, score: 22},
			{player_id: darius.id, score: 39}
		])

		gs = GameSession.create(game_date: '2017-03-10', name: 'Caylus', bgg_id: 18602)
		gs.player_scores.create([
			{player_id: mike.id, score: 90},
			{player_id: mel.id, score: 32},
			{player_id: keith.id, score: 78}
		])

	end
end




		# gs = GameSession.create(game_date: '', name: '', bgg_id: )
		# gs.player_scores.create([
		# 	{player_id: mike.id, score: },
		# 	{player_id: mel.id, score: },
		# 	{player_id: keith.id, score: },
		# 	{player_id: darius.id, score: }
		# ])
