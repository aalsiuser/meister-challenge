class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :summary, :author_name

  def author_name
    object.user.first_name
  end
end
