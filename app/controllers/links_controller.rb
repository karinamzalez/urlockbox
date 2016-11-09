class LinksController < ApplicationController
  def index
    @user = current_user
    @links = Link.where(user_id: current_user)
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      flash[:success] = "Successfully created #{@link.title}"
      redirect_to links_path
    else
      flash.now[:warning] = @link.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
    @user = current_user
  end

  def update
    link = Link.find(params[:id])
    if link.update(link_params)
      flash[:success] = "Your updates have been saved"
      redirect_to links_path
    else
      flash.now[:warning] = @link.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end
end
