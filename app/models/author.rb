class Author < ApplicationRecord
    has_secure_password

    has_many :articles

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, confirmation: true, presence: true
    validates :confirm_password, presence: true

end
