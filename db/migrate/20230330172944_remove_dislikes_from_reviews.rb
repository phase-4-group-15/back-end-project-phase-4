class RemoveDislikesFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :dislikes, :integer
  end
end
