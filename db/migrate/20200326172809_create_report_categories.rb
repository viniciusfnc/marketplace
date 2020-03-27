class CreateReportCategories < ActiveRecord::Migration[6.0]
  def up
    create_table :report_categories do |t|
      t.string :name, limit: 100
    end
  end

  def down
    drop_table :report_categories
  end
end
