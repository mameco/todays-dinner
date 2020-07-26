class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.string :point
      t.integer :time
      t.text :content
      t.timestamps
    end
  end
end
