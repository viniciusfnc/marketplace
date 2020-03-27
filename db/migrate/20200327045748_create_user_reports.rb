class CreateUserReports < ActiveRecord::Migration[6.0]
  def up
    create_table :user_reports do |t|
      t.integer :user_id, null: false
      t.integer :report_id, null: false
      t.timestamp :dt_init, null: false
      t.timestamp :dt_final, null: false
      t.string :payment_method, limit: 100, null: false
      t.string :notification_method, limit: 100, null: false
      t.timestamps
    end
    add_index('user_reports', %w[user_id report_id])
  end

  def down
    drop_table :user_reports
  end
end
