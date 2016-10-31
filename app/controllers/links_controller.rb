class LinksController < ApplicationController
  def index
    @user = current_user
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:success] = "Successfully created #{@link.title}"
      redirect_to links_path
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
