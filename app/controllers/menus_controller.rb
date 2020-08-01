class MenusController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  
  def index
    @menus = Menu.includes(:user).order("created_at DESC")
    
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
    @menu = Menu.find(params[:id])
  end

  def update
    menu = Menu.find(params[:id])
    menu.update(menu_params)
    redirect_to menu_path(menu.id)
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to root_path
  end

  def show
   @menu = Menu.find(params[:id])
  end

  private
  def menu_params
    params.require(:menu).permit(:content, :point, :time, :image, {images: []}).merge(user_id: current_user.id)
  end
end
