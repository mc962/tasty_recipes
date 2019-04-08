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

class Ingredient < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    has_many :recipe_step_ingredients
    has_many :recipe_steps, through: :recipe_step_ingredients
    has_many :recipes, through: :recipe_steps
    has_one_attached :profile_image
    
    validates :slug, :name, presence: true
end
