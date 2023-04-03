class CreateAdvertisements < ActiveRecord::Migration[7.0]
  def change
    create_table :advertisements do |t|
      t.text :image, null: false
      t.string :title, null: false
      t.string :genre, null: false
      t.string :release_date, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
