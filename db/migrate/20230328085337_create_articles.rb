class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :image, null: false
      t.string :category, null: false
      t.belongs_to :author, null: false, foreign_key: 

      t.timestamps
    end
  end
end
