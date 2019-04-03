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
  pending "add some examples to (or delete) #{__FILE__}"
end
