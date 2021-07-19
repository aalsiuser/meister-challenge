class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :summary, :author_name, :author_id

  def author_name
    object.author.first_name
  end
end
