class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :slug, null: false
      t.string :name, null: false
      t.text :description

      t.timestamps
    end

    add_index :ingredients, :slug, unique: true
    add_index :ingredients, :name, unique: true
  end
end
