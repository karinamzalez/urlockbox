class Api::V1::LinksController < ApplicationController
  def update
    @link = Link.find(params[:id])
    @link.change_read_status
    render json: @link
  end

  def index
    @links = Link.sort_alphabetically(current_user)
    render json: @links
  end
end
