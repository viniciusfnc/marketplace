# frozen_string_literal: true

class UserReport < ApplicationRecord
  belongs_to :user
  belongs_to :report

  enum payment_method: %i[C P]
  enum notification_method: %i[E T]
end
