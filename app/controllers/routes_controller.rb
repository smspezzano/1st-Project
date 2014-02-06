class RoutesController < ApplicationController

	def index
		@strategies = {:DEFAULT_STRATEGY => 'Default Strategy', :AVOID_UP_HILL => 'Avoid up hill', 
			:AVOID_DOWN_HILL => 'Avoid down hill', :AVOID_ALL_HILLS => 'Avoid all hills', 
			:FAVOR_UP_HILL => 'Favor up hill', :FAVOR_DOWN_HILL => 'Favor down hill',
			:FAVOR_ALL_HILLS => 'Favor all hills'
		}
	end

	def create
		new_route= params.require(:route).permit(:startLocation, :endLocation, :roadGradeStrategy)
		@route= Route.new(new_route)
		@results = getRoute(@route.startLocation, @route.endLocation, @route.roadGradeStrategy)
		redirect_to @route
	end

	def show
	    @route = Route.find(params[:id])
	end


end
