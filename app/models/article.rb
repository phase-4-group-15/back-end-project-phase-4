class Article < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    CATEGORY = ['Food & Drink', 'Self Improvement', 'Travel', 'Technology', 'Fitness', "business"]
  
    validates :title, presence: true
    validates :description, presence: true
    validates :image, presence: true
    validates :category, presence: true, inclusion: CATEGORY
    validates :likes, presence: true
    validates :dislikes, presence: true
  end
  