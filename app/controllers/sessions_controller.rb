class SessionsController < ApplicationController
  def new
    session[:return_to] ||= request.referer
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to links_path
    else
      flash.now[:warning] = "Invalid email or password. Try Again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Goodbye!"
    redirect_to root_path
  end
end
