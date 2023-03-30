class RemoveDislikesFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :dislikes, :integer

    add_column :reviews, :rating, :integer
    add_column :reviews, :comment, :text
  end
end
