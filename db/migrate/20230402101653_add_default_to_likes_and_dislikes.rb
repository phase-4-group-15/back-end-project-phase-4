class AddDefaultToLikesAndDislikes < ActiveRecord::Migration[7.0]
  def change
    change_column :articles, :likes, :integer, default: 0
  
  end
end
