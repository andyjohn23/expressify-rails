class UserIndexSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :location
end
