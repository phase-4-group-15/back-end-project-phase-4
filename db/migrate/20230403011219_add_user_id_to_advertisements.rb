class AddUserIdToAdvertisements < ActiveRecord::Migration[7.0]
  def change
    add_reference :advertisements, :user, null: false, foreign_key: true
  end
end
