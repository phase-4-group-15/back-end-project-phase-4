class Article < ApplicationRecord
  has_many :reviews 
  belongs_to :user

  CATEGORY = ['Food & Drink', 'Self Improvement', 'Travel', 'Technology', 'Fitness', "business", "Sports"]

  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :category, presence: true, inclusion: {
    in: CATEGORY,
    message: "must be one of: #{CATEGORY.join(', ')}"
  }
  # validates :likes, numericality: { only_integer: true }
  # validates :dislikes, numericality: { only_integer: true }
end
