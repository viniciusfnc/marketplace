class CreateLabelsReportsJoin < ActiveRecord::Migration[6.0]
  def up
    create_table :labels_reports, id: false do |t|
      t.integer 'label_id', null: false
      t.integer 'report_id', null: false
    end
    add_index('labels_reports', ['label_id', 'report_id'])
  end

  def down
    drop_table :labels_reports
  end
end
