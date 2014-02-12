class RoutesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :new, :show]

	def index
		@strategies = {:DEFAULT_STRATEGY => 'Default Strategy', :AVOID_UP_HILL => 'Avoid up hill', 
			:AVOID_DOWN_HILL => 'Avoid down hill', :AVOID_ALL_HILLS => 'Avoid all hills', 
			:FAVOR_UP_HILL => 'Favor up hill', :FAVOR_DOWN_HILL => 'Favor down hill',
			:FAVOR_ALL_HILLS => 'Favor all hills'
		}
	end

	def new
		@route= Route.new
		render nothing: true
	end

	def create
		route= Route.new(startLocation: params[:startLocation], endLocation: params[:endLocation],endLocation: params[:roadGradeStrategy])
		route.user = current_user
		route.save

		#binding.pry
		redirect_to user_path(route.user)
	end

	def show
		id = params[:id]
	    @route = Route.find_by(params[user_id: id])
		#binding.pry
		@strategies = {:DEFAULT_STRATEGY => 'Default Strategy', :AVOID_UP_HILL => 'Avoid up hill', 
			:AVOID_DOWN_HILL => 'Avoid down hill', :AVOID_ALL_HILLS => 'Avoid all hills', 
			:FAVOR_UP_HILL => 'Favor up hill', :FAVOR_DOWN_HILL => 'Favor down hill',
			:FAVOR_ALL_HILLS => 'Favor all hills'
		}
	end


end
