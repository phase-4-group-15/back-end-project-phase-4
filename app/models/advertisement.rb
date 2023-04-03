class Advertisement < ApplicationRecord
<<<<<<< HEAD
=======

>>>>>>> Shukri-rails
    belongs_to :user

    validates :image, presence: true
    validates :title, presence: true
<<<<<<< HEAD
    validates :genre, presence: true
    validates :release_date, presence: true
=======
    validates :content, presence: true
    validates :release_date, presence: true

>>>>>>> Shukri-rails
end
