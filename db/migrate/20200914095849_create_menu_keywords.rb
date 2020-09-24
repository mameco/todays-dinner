class CreateMenuKeywords < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_keywords do |t|
      t.references :menu, foreign_key: true
      t.references :keyword, foreign_key: true
      t.timestamps
    end
  end
end
