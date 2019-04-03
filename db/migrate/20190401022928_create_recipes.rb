class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :slug, null: false
      t.string :name, null: false
      t.text :description
      t.text :instructions, array: true, null: false
      t.float :completion_time

      t.timestamps
    end
    
    add_index :recipes, :slug, unique: true
    add_index :recipes, :name, unique: true
  end
end
