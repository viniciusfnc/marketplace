# frozen_string_literal: true

class Kpi < ApplicationRecord
  has_and_belongs_to_many :reports

  scope :sorted, -> { order(:name) }
end
