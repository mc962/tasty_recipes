# == Schema Information
#
# Table name: ingredients
#
#  id          :bigint(8)        not null, primary key
#  slug        :string           not null
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :ingredient do
    name { Faker::Food.ingredient }
    description { Faker::Food.description }
    
    # factory :ingredient_with_recipes do
    #   ignore do
    #     recipe_count 5
    #   end

    #   after(:create) do |ingredient, evaluator| do
    #     FactoryBot.create_list(:recipe, evaluator.recipe_count, ingredients: [ingredient])
    #   end
    # end
  end
end
