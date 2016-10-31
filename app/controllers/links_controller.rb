class LinksController < ApplicationController
  def index
    @user = current_user
    @links = Link.where(user_id: current_user)
  end
end
