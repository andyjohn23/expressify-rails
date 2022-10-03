class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)
  
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
end
