class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
    @private_wikis = @wikis.visible_to(current_user)
    @user_wikis = @wikis.user_wikis(current_user)
    @public_wikis = @wikis.public_wikis(@wikis)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @user = current_user
    @wiki = Wiki.new
  end

  def create
    @user = current_user
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    if @wiki.save
      redirect_to @wiki, notice: "Wiki saved!"
    else
      flash.now[:alert] = "Error occured. Try again."
      render :new
    end

  end

  def edit
    @wiki = Wiki.find(params[:id])
    @users = User.all
    @get_wikis = Collaborator.where(wiki_id: @wiki.id)
    @collaborators = User.where(id: @get_wikis.pluck(:user_id))
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)

    if @wiki.save
      redirect_to @wiki, notice: "Wiki updated!"
    else
      flash.now[:alert] = "Error occured. Try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "Error occured. Try again."
      render :show
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:user_id, :title, :body, :private)
  end

end
