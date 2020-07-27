Rails.application.routes.draw do
  get 'menus/index'
  root "menus#index"
end
