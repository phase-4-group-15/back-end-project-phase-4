class CreateAdvertisements < ActiveRecord::Migration[7.0]
  def change
    create_table :advertisements do |t|
      t.string :title
      t.string :content
      t.string :image
      t.integer :release_date

      t.timestamps
    end
  end
end
