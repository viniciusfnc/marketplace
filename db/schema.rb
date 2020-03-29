# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_328_003_540) do
  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.integer 'record_id', null: false
    t.integer 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'kpis', force: :cascade do |t|
    t.string 'name', limit: 100, null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'kpis_reports', id: false, force: :cascade do |t|
    t.integer 'kpi_id', null: false
    t.integer 'report_id', null: false
    t.index %w[kpi_id report_id], name: 'index_kpis_reports_on_kpi_id_and_report_id'
  end

  create_table 'labels', force: :cascade do |t|
    t.string 'name', limit: 100, null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'labels_reports', id: false, force: :cascade do |t|
    t.integer 'label_id', null: false
    t.integer 'report_id', null: false
    t.index %w[label_id report_id], name: 'index_labels_reports_on_label_id_and_report_id'
  end

  create_table 'report_categories', force: :cascade do |t|
    t.string 'name', limit: 100
  end

  create_table 'reports', force: :cascade do |t|
    t.string 'name', limit: 100, null: false
    t.string 'short_description', limit: 250, null: false
    t.text 'description', null: false
    t.integer 'temporal', null: false
    t.integer 'geographic', null: false
    t.decimal 'base_price', precision: 13, scale: 2, null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'user_reports', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'report_id', null: false
    t.datetime 'dt_init', null: false
    t.datetime 'dt_final', null: false
    t.integer 'payment_method', null: false
    t.integer 'notification_method', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[user_id report_id], name: 'index_user_reports_on_user_id_and_report_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
end
