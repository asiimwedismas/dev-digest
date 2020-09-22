class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :author, index: true
      t.string :title
      t.text :text

      t.timestamps
    end
    # add_index :articles, :post_id
    add_foreign_key :articles, :users, column: :author_id
  end
end
