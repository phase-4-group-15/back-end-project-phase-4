class Review < ApplicationRecord
  belongs_to :article
  belongs_to :user

  # validates_associated :article, :user
  validates :likes, presence: true
  validates :dislikes, presence: true
end
