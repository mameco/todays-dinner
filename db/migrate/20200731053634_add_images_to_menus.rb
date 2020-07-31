class AddImagesToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :images, :string
  end
end
