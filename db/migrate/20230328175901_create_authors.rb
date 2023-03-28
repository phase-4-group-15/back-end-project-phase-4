class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :email
      t.string :password_digest
      t.string :confirm_password

      t.timestamps
    end
  end
end
