class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.integer :name, null: false
      t.string :image, null: false
      t.string :point
      t.text :content
      t.references :cookingTime, optional: true
      t.timestamps
    end
  end
end
