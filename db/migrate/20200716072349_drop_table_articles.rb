class DropTableArticles < ActiveRecord::Migration[6.0]
  def change
    drop_table :articles do |t|
      t.string "author", null: false
      t.string "title", null: false
      t.text "body", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
