class UsersController < ApplicationController
  def show
    id = (params[:id])
    @user = User.find(id)
    @routes = Route.find_by(user_id: id)
    #binding.pry
  end

  def new
    @user = User.new()
  end

  def create
    new_user = params.require(:user).permit(:name, :email, :password, :password_confirmation)
    @user=User.new(new_user)
    if @user.save
      flash[:success] = "Welcome to Such Map!"
      sign_in @user
      redirect_to @user
    else
      render'new'
    end
  end

  def update
    user_params = params.require(:user).permit(:name, :email)
    @user = User.find(user_params[:id])
    @user.update_attributes(name: user_params[:name], email: user_params[:email])
    render :show
  end
end
