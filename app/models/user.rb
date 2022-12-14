class User < ApplicationRecord
    has_many :posts
    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence:true, uniqueness:true, format: {with: VALID_EMAIL_REGEX}
    validates :username, presence: true
end
