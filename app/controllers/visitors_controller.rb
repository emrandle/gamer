class VisitorsController < ApplicationController
	def index
		@groups = GameGroup.all

		@hotness = MyBgg.hotness
	end
end
