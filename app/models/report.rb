class Report < ApplicationRecord

  has_and_belongs_to_many :kpis
  has_and_belongs_to_many :labels

  has_many :user_reports
  has_many :users, through: :user_reports

  scope :sorted, -> {order(:name)}

  enum geographic: [:CO, :DS, :CY]
  enum temporal: [:D, :W, :M, :Y]


end