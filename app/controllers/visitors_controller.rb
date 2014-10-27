class VisitorsController < ApplicationController
	respond_to :html

	def index
		@recipes = Recipe.all
    	respond_with(@recipes)
	end
end
