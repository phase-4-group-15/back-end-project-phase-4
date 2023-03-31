class Article < ApplicationRecord
  has_many :reviews 
  belongs_to :user

  CATEGORY = ['Food & Drink', 'Self Improvement', 'Travel', 'Technology', 'Fitness', "business"]

  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :category, presence: true, inclusion: CATEGORY
  validates :likes, numericality: { only_integer: true }, allow_nil: true
  validates :dislikes, numericality: { only_integer: true }, allow_nil: true
end
