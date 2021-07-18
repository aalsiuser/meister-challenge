class CommentReactionsSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :post_id, :reaction_type
end
