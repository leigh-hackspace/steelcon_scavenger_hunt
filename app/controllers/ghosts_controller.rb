class GhostsController < ApplicationController
  def all
	  @ghosts = Ghost.all
  end

  def show
	  @ghost = Ghost.find_by_ghost_uuid(params[:ghost_uuid])
  end

  def new
	  @ghost = Ghost.new
  end

  def create
    @ghost = Ghost.new(ghost_params)
    @ghost.ghost_uuid = SecureRandom.uuid
    #@ghost.image(@ghost.ghost_uuid + ".png")

    if @ghost.save
      redirect_to ghost_path(@ghost.ghost_uuid)
    else
      render :new
    end
  end

  def ghost_params
    params.require(:ghost).permit(:title, :body, :image)
  end
end
