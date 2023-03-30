class Article < ApplicationRecord
    belongs_to :author
    has_many :reviews
    has_many :users, through: :reviews

    CATEGORY = ['Food & Drink', 'Self Improvement', 'Travel', 'Technology', 'Fitness']
  
    validates :title, presence: true
    validates :description, presence: true
    validates :image, presence: true
    validates :category, presence: true, inclusion: CATEGORY
    validates :author, presence: true
  end
  