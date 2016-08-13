class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :cuisine
      t.string :food_type
      t.integer :serves
      t.integer :cooking_time
      t.string :level
      t.string :ingredients
      t.text :directions

      t.timestamps
    end
  end
end
