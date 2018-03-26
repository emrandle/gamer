require 'bgg-api'

module MyBgg
	def self.query_by_name(name)
		ary = []

		bgg = BggApi.new
		hash_result = bgg.search( {:query => name, :type => 'boardgame'} )

		if hash_result['total'].to_i > 0
			hash_result['item'].each do |item|
				hsh = Hash.new
				hsh['id'] = item['id']
				hsh['name'] = item['name'][0]['value']
				ary << hsh
			end
		end

		ary
	end

	def self.find_by_id(id)
		bgg = BggApi.new
		hash_result = bgg.thing( {:id => id, :type => 'boardgame'} )
		item = hash_result['item'][0]

		if item.nil?
			return nil
		end

		game = BggGame.new
		game.bgg_id = item['id']
		game.bgg_name = item['name'][0]['value']
		game.thumbnail = item['thumbnail'][0]
		game.year_published = item['yearpublished'][0]['value']

		game
	end

	def self.hotness
		bgg = BggApi.new
		hash_result = bgg.hot({:type => 'boardgame'})
		item_ary = hash_result['item']
		games = []

		unless item_ary.nil?
			item_ary.each do |hsh|
				game = BggGame.new
				game.bgg_id = hsh['id']
				game.bgg_name = hsh['name'][0]['value']
				game.rank = hsh['rank']
				game.thumbnail = hsh['thumbnail'][0]['value']
				game.year_published = hsh['yearpublished'][0]['value']

				games << game
			end
		end

		games
	end
end