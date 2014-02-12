require 'spec_helper'

describe RoutesController do

	describe "GET new" do


		before(:each) do
			user = mock_model("User")
			allow(User).to receive(:new).and_return(user)
			allow(User).to receive(:find_by_remember_token).and_return(user)
		end
		
		it 'should assign @route' do
			route = mock_model("Route")
			allow(Route).to receive(:new).and_return(route)
			get :new
			expect(assigns(:route)).to eq(route)
		end

	end

	# describe 'POST create' do

	# 	before(:each) do
	# 		user = mock_model("User")
	# 		@current_user = user
	# 	end

	# 	it "should redirect to user_path " do
	# 		get :create
	# 		expect(response).to redirect_to(user_path)
	# 	end


	# end


end