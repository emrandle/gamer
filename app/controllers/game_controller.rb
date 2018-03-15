class GameController < ApplicationController
	def search_for_game
		@result = MyBgg.query_by_name(params[:name])

		render json: @result
	end
end
