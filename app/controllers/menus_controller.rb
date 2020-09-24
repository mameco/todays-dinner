class MenusController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_menu, only: [:edit, :destroy, :show, :update]

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
    @menus = Menu.search(params[:keyword]).order("created_at DESC").uniq
  end

  def edit
    if @menu.user != current_user
      redirect_to root_path
    end
  end

  def update
    @menu.update(menu_params)
    if @menu.save
      redirect_to menu_path(@menu.id)
    else
      redirect_to edit_menu_path(@menu)
    end
  end

  def destroy
    user = @menu.user
    if user != current_user
      redirect_to root_path
    else
      @menu.destroy
      redirect_to root_path
    end
  end

  def show
  end

  private
  def menu_params
    params.require(:menu).permit(:cookingTime_id, :content, :point, :image, {images: []}, keyword_ids: [], ).merge(user_id: current_user.id)
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end
end
