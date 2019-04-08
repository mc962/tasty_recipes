# == Schema Information
#
# Table name: recipe_step_ingredients
#
#  id             :bigint(8)        not null, primary key
#  recipe_step_id :bigint(8)
#  ingredient_id  :bigint(8)
#  amount         :integer
#  amount_unit    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class RecipeStepIngredient < ApplicationRecord
    belongs_to :recipe_step
    belongs_to :ingredient

    accepts_nested_attributes_for :ingredient
end
