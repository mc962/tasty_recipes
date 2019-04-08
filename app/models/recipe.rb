# == Schema Information
#
# Table name: recipes
#
#  id              :bigint(8)        not null, primary key
#  slug            :string           not null
#  name            :string           not null
#  description     :text
#  completion_time :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Recipe < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
  
    # if recipe is destroyed, then all matching recipe_steps must also be destroyed
    has_many :recipe_steps, dependent: :destroy
    has_many :ingredients, through: :recipe_steps

    has_one_attached :profile_image

    accepts_nested_attributes_for :recipe_steps

    validates :slug, :name, presence: true
end
