# == Schema Information
#
# Table name: recipes
#
#  id              :bigint(8)        not null, primary key
#  slug            :string           not null
#  name            :string           not null
#  description     :text
#  instructions    :text             not null, is an Array
#  completion_time :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Recipe < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    has_and_belongs_to_many :ingredients # TODO confirm that join table entry is deleted
    has_one_attached :profile_image

    validates :slug, :name, :instructions, presence: true
end
