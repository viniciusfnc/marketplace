# frozen_string_literal: true

class CreateUserReports < ActiveRecord::Migration[6.0]
  def up
    create_table :user_reports do |t|
      t.integer :user_id, null: false
      t.integer :report_id, null: false
      t.timestamp :dt_init, null: false
      t.timestamp :dt_final, null: false
      t.integer :payment_method, null: false
      t.integer :notification_method, null: false
      t.timestamps
    end
    add_index('user_reports', %w[user_id report_id])
  end

  def down
    drop_table :user_reports
  end
end
