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
    

  end

  private
  def menu_params
    params.require(:menu).permit(:image, :content, :point, :time).merge(user_id: current_user.id)
  end
end
