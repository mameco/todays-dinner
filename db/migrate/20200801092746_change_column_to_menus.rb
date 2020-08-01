class ChangeColumnToMenus < ActiveRecord::Migration[6.0]
  def change
    change_column :menus, :image, :string, null: false
    change_column :menus, :point, :string, null: false
    change_column :menus, :time, :integer, null: false
    change_column :menus, :content, :text, null: false
  end
end
