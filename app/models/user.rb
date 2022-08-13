class User < ApplicationRecord
    include Devise::JWT::RevocationStrategies::JTIMatcher
    has_many :posts

    devise :database_authenticatable, :registerable, :validatable,
            :jwt_authenticatable, jwt_revocation_strategy: self

    validates :email, {presence: true, uniqueness: true}
    validates :username, {presence: true}
    validates :password, {presence: true}
end
