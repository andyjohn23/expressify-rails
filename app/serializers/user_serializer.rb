class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :location
  has_many :posts
end
