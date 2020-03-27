# frozen_string_literal: true

FactoryBot.define do
  factory :user_report do
    id { Faker::Number.digit }
    dt_init { Faker::Date.in_date_period }
    dt_final { Faker::Date.in_date_period }
    payment_method { 'C' }
    notification_method { 'E' }
  end
end
