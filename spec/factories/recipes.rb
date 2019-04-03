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

FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    description { Faker::Food.description }
    instructions { [] } # TODO change this to a real value at some point
    completion_time { Float(Random.rand(100)) }
  end
end
