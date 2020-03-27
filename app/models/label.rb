# frozen_string_literal: true

class Label < ApplicationRecord
  has_and_belongs_to_many :reports

  scope :sorted, -> { order(:name) }
end
