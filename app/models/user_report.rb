class UserReport < ApplicationRecord
  belongs_to :user
  belongs_to :report

  enum payment_method: [:C, :P]
  enum notification_method: [:E, :T]

end
