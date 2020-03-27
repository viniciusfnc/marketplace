# frozen_string_literal: true

class Report < ApplicationRecord
  has_and_belongs_to_many :kpis
  has_and_belongs_to_many :labels

  has_many :user_reports
  has_many :users, through: :user_reports

  scope :sorted, -> { order(:name) }

  enum geographic: %i[CO DS CY]
  enum temporal: %i[D W M Y]
end
