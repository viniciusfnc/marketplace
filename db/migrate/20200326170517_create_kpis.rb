# frozen_string_literal: true

class CreateKpis < ActiveRecord::Migration[6.0]
  def up
    create_table :kpis do |t|
      t.string :name, limit: 100, null: false
      t.timestamps
    end
  end

  def down
    drop_table :kpis
  end
end
