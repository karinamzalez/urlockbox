class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to links_index_path
    else
      
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
end