# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :report do
    id { Faker::Number.digit }
    name { Faker::Name.name }
    short_description { Faker::TvShows::GameOfThrones.quote }
    description { Faker::TvShows::Simpsons.quote }
    temporal { 0 }
    kpis { [] }
    labels { [] }
    geographic { 0 }
    base_price { Faker::Number.number(digits: 2) }
  end
end
