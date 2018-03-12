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
		item = hash_result['item']

		if item.nil?
			return nil
		end

		item[0]
	end
end