class Review < ApplicationRecord
  belongs_to :article
  belongs_to :user


  validates :comment, presence: true
  validates :rating, presence: true

end