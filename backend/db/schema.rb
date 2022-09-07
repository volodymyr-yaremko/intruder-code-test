# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_09_07_001007) do

  create_table "plugin_families", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plugins", force: :cascade do |t|
    t.string "nessus_id"
    t.string "name"
    t.integer "check_type"
    t.string "version"
    t.integer "plugin_family_id"
    t.datetime "modified_at"
    t.datetime "published_at"
    t.index ["plugin_family_id"], name: "index_plugins_on_plugin_family_id"
  end

  create_table "report_hosts", force: :cascade do |t|
    t.string "name"
    t.integer "report_id"
    t.text "props", default: "{}"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["report_id"], name: "index_report_hosts_on_report_id"
  end

  create_table "report_items", force: :cascade do |t|
    t.string "svc_name"
    t.integer "port"
    t.integer "protocol", default: 0
    t.integer "severity", default: 0
    t.integer "risk_factor", default: 0
    t.text "synopsis"
    t.text "description"
    t.text "solution"
    t.text "output"
    t.integer "report_host_id"
    t.integer "plugin_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plugin_id"], name: "index_report_items_on_plugin_id"
    t.index ["report_host_id"], name: "index_report_items_on_report_host_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
