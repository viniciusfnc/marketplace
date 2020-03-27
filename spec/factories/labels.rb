# frozen_string_literal: true

FactoryBot.define do
  factory :label do
    id { Faker::Number.digit }
    name { Faker::Name.name }
  end
end
