# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[6.0]
  def up
    create_table :reports do |t|
      t.string :name, limit: 100, null: false
      t.string :short_description, limit: 250, null: false
      t.text :description, null: false
      t.integer :temporal, null: false
      t.integer :geographic, null: false
      t.decimal :base_price, precision: 13, scale: 2, null: false
      t.timestamps
    end
  end

  def down
    drop_table :reports
  end
end
