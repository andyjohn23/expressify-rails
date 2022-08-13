class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :username, :email, :location, :created_at
  has_many :posts
end
