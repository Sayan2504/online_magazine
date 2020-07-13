class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :author, null: false
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
