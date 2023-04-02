class AddDislikesToArticles < ActiveRecord::Migration[7.0]
  def change
    change_column :articles, :dislikes, :integer, default: 0
  end
end
