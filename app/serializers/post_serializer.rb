class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :summary
end
