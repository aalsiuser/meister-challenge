# Post Serializer to serialize payload while sending it to Frontend
class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :summary, :author_name, :author_id, :comments_count

  def author_name
    object.author.first_name
  end
end
