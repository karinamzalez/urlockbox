class Api::V1::LinksController < ApplicationController
  def update
    @link = Link.find(params[:id])
    @link.change_read_status
    render json: @link
  end

  def index
    if params[:read] == "t"
      @links = Link.where(user_id: current_user, read: "t")
      render json: @links
    else
      @links = Link.where(user_id: current_user, read: "f")
    end
  end
end
