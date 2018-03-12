class GameController < ApplicationController
	def search_for_game(params)
debugger
		result = MyBgg.query_by_name(name)

		render result.to_json
	end
end
