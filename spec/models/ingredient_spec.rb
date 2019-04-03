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

require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "validates required attributes" do
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:name) }
  end
end
