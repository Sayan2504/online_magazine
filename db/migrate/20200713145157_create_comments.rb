class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :commenter, null: false
      t.text :comment, null: false
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
