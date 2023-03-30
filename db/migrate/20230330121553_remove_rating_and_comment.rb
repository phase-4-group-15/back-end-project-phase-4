class RemoveRatingAndComment < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :rating
    remove_column :reviews, :comment
    
    add_column :reviews, :likes, :integer
    add_column :reviews, :dislikes, :integer
  end
end
