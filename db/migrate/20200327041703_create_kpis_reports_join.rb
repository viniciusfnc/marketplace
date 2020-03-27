# frozen_string_literal: true

class CreateKpisReportsJoin < ActiveRecord::Migration[6.0]
  def up
    create_table :kpis_reports, id: false do |t|
      t.integer 'kpi_id', null: false
      t.integer 'report_id', null: false
    end
    add_index('kpis_reports', %w[kpi_id report_id])
  end

  def down
    drop_table :kpis_reports
  end
end
