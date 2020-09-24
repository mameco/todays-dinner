class ChangeColumnToMenus < ActiveRecord::Migration[6.0]
  def up
    change_column :menus, :image, :string, null: false
    change_column :menus, :point, :string, null: false
    change_column :menus, :content, :text, null: false
  end
end
