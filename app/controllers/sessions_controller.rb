class SessionsController < ApplicationController
  def new

  end

  def create

  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Goodbye!"
    redirect_to root_path
  end
end
