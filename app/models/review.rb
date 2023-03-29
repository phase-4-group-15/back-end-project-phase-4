class Review < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :rating, presence: true, length: { in: 0..5 }
  validates_associated :article, :user
end
