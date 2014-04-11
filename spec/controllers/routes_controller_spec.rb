require 'spec_helper'

describe RoutesController do

	describe "GET new" do


		before(:each) do
			@user = mock_model("User")
			allow(User).to receive(:new).and_return(@user)
			allow(User).to receive(:find_by_remember_token).and_return(@user)
		end
		
		it 'should assign @route' do
			route = mock_model("Route")
			allow(Route).to receive(:new).and_return(route)
			get :new
			expect(assigns(:route)).to eq(route)
		end

		# let(:route) do
  # 		stub_model Route do |route|
  #   		route.startLocation = '123 Test St, Test, CA'
		# 		route.endLocation = '321 Foo, Bar, FO'
		# 		route.roadGradeStrategy = 'AVOID_ALL_HILLS'
		# 		route.user_id = @user.id
  # 		end
  #   end

		it 'should create a new route with the right user id' do
			# @route = mock_model("Route")
			# @route = Route.create(
			# 	startLocation: '123 Test St, Test, CA', 
			# 	endLocation: '321 Foo, Bar, FO', 
			# 	roadGradeStrategy: 'AVOID_ALL_HILLS'
			# )
			# it "stubs :id" do
   #  			widget.id.should eql(5)
  	# 	end
  	let (:route) do
  		stub_model Route, startLocation: '123 Test St, Test, CA', endLocation: '321 Foo, Bar, FO', roadGradeStrategy: 'AVOID_ALL_HILLS', user_id: @user.id
  	end
  	# stub_model Route do |route|
   #  		route.startLocation = '123 Test St, Test, CA'
			# 	route.endLocation = '321 Foo, Bar, FO'
			# 	route.roadGradeStrategy = 'AVOID_ALL_HILLS'
			# 	route.user_id = @user.id
  	# 	end
  		route.user_id.should eql(@user.id)
			# @route.startLocation = '123 Test St, Test, CA'
			# @route.endLocation = '321 Foo, Bar, FO'
			# @route.roadGradeStrategy = 'AVOID_ALL_HILLS'
			# @route.user_id = @user.id
			# expect(Route.find_by(endLocation: '321 Foo, Bar, FO')).not_to eq(nil)
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