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
	end

	describe "create new" do

		before(:each) do
			@user = mock_model("User")
			allow(User).to receive(:new).and_return(@user)
			allow(User).to receive(:find_by_remember_token).and_return(@user)
		end

		it 'should create a new route with the right user id' do
  		route = stub_model Route, 
  			startLocation: '123 Test St, Test, CA', 
  			endLocation: '321 Foo, Bar, FO', 
  			roadGradeStrategy: 'AVOID_ALL_HILLS', 
  			user_id: @user.id

  		route.user_id.should eql(@user.id)
		end

		it "should be able to create multiple routes" do
			route1 = mock_model Route, 
				startLocation: '123 Test St, Test, CA', 
  			endLocation: '321 Foo, Bar, FO', 
  			roadGradeStrategy: 'AVOID_ALL_HILLS', 
  			user_id: @user.id

  		route2 = mock_model Route,
				startLocation: '123 Test St, Test, CA', 
  			endLocation: '321 Foo, Bar, FO', 
  			roadGradeStrategy: 'FAVOR_ALL_HILLS', 
  			user_id: @user.id
			expect(route1.user_id === route2.user_id).to be true
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