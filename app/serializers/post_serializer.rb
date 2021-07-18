class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :summary
end
