class CreateRecipeStepTables < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_steps do |t|
      t.belongs_to :recipe, foreign_key: true
      t.integer :step_number, null: false
      t.text :instruction, null: false

      t.timestamps
    end

    create_table :recipe_step_ingredients do |t|
      t.references :recipe_step, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.integer :amount # stored in database as SI units, translated from original unit to SI units (if possible) 
      t.integer :amount_unit 

      t.timestamps
    end

    add_index :recipe_steps, :step_number, unique: true
  end
end
