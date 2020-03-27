# frozen_string_literal: true

FactoryBot.define do
  factory :kpi do
    id { Faker::Number.digit }
    name { Faker::Name.name }
  end
end
