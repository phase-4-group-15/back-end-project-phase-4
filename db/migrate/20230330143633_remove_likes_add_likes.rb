class RemoveLikesAddLikes < ActiveRecord::Migration[7.0]
  def change

    remove_column :reviews, :likes, :integer
    remove_column :reviews, :dislikes, :integer

    add_column :articles, :likes, :integer
    add_column :articles, :dislikes, :integer
  end
end
