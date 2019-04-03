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
    
  end
end
