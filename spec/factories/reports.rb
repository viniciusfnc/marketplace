# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :report do
    name { Faker::Name.name }
    short_description { Faker::Name.name }
    description { Faker::Name.name }
    temporal { 'D' }
    kpis { [] }
    labels { [] }
    geographic { 'CO' }
    base_price { Faker::Number.number(digits: 2) }
  end
end
