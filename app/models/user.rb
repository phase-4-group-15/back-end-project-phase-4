class User < ApplicationRecord
    has_secure_password

    has_many :reviews, dependent: :destroy

<<<<<<< HEAD
    has_many :advertisements

=======
    has_many :articles
   
    has_many :advertisements
>>>>>>> Shukri-rails

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
