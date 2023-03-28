class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name, null: false
      t.text :email, null: false
      t.string :password_digest, null: false, unique: true
      t.string :confirm_password, null: false, unique: true

      t.timestamps
    end
  end
end
