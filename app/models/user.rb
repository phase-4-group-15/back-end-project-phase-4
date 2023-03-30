class User < ApplicationRecord
    has_secure_password
    has_many :reviews, dependent: :destroy
    has_many :articles, through: :reviews


    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, confirmation: true, presence: true
    # validates :password_confirmation, presence: true
end
