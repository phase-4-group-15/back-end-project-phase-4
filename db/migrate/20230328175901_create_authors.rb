class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name, null: false
      t.text :email, null: false, unique: true
      t.string :password_digest, null: false
      t.text :bio, null: false

      t.timestamps
    end
  end
end
