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
    
    has_and_belongs_to_many :recipes # TODO confirm that join table entry is deleted
    has_one_attached :profile_image
    
    validates :slug, :name, presence: true
end
