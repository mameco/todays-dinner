class CreateCookingTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :cooking_times do |t|
      t.string :time
      t.timestamps
    end
  end
end
