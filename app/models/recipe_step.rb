# == Schema Information
#
# Table name: recipe_steps
#
#  id          :bigint(8)        not null, primary key
#  recipe_id   :bigint(8)
#  step_number :integer          not null
#  instruction :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class RecipeStep < ApplicationRecord
    belongs_to :recipe
    
    has_many :recipe_step_ingredients
    has_many :ingredients, through: :recipe_step_ingredients

    accepts_nested_attributes_for :recipe_step_ingredients
end
