class Api::V1::LinksController < ApplicationController
  def update
    @link = Link.find(params[:id])
    @link.change_read_status
    render json: @link
  end
end
