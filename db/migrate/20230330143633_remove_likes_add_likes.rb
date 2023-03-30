class RemoveLikesAddLikes < ActiveRecord::Migration[7.0]
  def change

    remove_column :reviews, :likes
    remove_column :reviews, :likes

    add_column :articles, :likes, :integer
    add_column :articles, :dislikes, :integer
  end
end
