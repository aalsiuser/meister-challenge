class CommentSerializer < ActiveModel::Serializer
  attributes :id, :post_id, :content

  has_many :comment_reactions do
    object.comment_reactions.map do |cr|
      {
        id: cr.id,
        user_name: cr.user.first_name,
        comment_id: cr.comment_id,
        reaction_type: cr.reaction_type
      }
    end
  end
end
