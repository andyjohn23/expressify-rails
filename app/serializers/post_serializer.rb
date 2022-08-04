class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :owner
  belongs_to :user

  def owner
    user_id = self.object.user.find {|user| user.isAdmin == true }.user_id
    if user_id 
      user = User.find_by(id: user_id)
      {
          id: user.id, 
          email: user.email,
          username: user.username,
      }
    end
  end
end
