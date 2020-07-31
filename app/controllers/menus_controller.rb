class MenusController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  
  def index
    @menus = Menu.includes(:user)
    
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.create(menu_params)
    if @menu.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    @menus = Menu.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit

  end

  def update

  end

  def show
   @menu = Menu.find(params[:id])
  end

  private
  def menu_params
    params.require(:menu).permit(:content, :point, :time, :image, {images: []}).merge(user_id: current_user.id)
  end
end
