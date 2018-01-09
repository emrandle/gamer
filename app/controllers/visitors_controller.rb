class VisitorsController < ApplicationController
	def index
		@groups = GameGroup.all
	end
end
