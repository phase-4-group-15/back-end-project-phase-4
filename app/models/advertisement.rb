class Advertisement < ApplicationRecord

    belongs_to :user

    validates :image, presence: true
    validates :title, presence: true
    validates :content, presence: true
    validates :release_date, presence: true

end
