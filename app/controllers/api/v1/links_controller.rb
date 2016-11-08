class Api::V1::LinksController < ApplicationController

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      flash[:success] = "Successfully created #{@link.title}"
      render json: @link
    else
      flash.now[:warning] = @link.errors.full_messages.join(", ")
      render :new
    end
  end

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end
end
