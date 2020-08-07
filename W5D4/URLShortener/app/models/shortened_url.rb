#   create_table "shortened_urls", force: :cascade do |t|
#     t.string "long_url", null: false
#     t.string "short_url", null: false
#     t.integer "user_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["user_id"], name: "index_shortened_urls_on_user_id"
#   end


class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true
    validates :short_url, presence: true, uniqueness: true
    validates :user_id, presence: true
end