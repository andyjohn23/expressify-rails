class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image_url, :user_id, :created_at
  belongs_to :user
end
