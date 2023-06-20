

ActiveRecord::Schema[7.0].define(version: 2023_06_14_180136) do
  create_table "crew_members", force: :cascade do |t|
    t.string "name"
    t.string "job_title"
    t.integer "production_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "salary"
    t.index ["production_id"], name: "index_crew_members_on_production_id"
  end

  create_table "productions", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.integer "budget"
    t.string "image"
    t.string "director"
    t.boolean "ongoing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  add_foreign_key "crew_members", "productions"
end
