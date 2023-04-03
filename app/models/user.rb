class User < ApplicationRecord
    has_secure_password

    has_many :reviews, dependent: :destroy

    has_many :articles
   
    has_many :advertisements

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
