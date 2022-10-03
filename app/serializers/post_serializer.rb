class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image_url, :user_id
  belongs_to :user
end
