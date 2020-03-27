class Label < ApplicationRecord

  has_and_belongs_to_many :labels

  scope :sorted, -> {order(:name)}
end
