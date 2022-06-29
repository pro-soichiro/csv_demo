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

ActiveRecord::Schema[7.0].define(version: 2022_06_29_093524) do
  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "scout_email_notification", default: true
    t.boolean "introduction_project_email", default: true
    t.boolean "advertisement_delivery", default: true
    t.boolean "email_magazine", default: true
    t.boolean "contact_from_manager", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
