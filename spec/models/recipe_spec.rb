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

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "validates required attributes" do
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:instructions) }
  end
end
