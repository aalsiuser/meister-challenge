class CommentReactionForm
  extend Dry::Initializer[undefined: false]

  # Mandatory Attributes
  option :user_id
  option :comment_id
  option :reaction_type

  attr_reader :record

  def save
    @record = build_comment_reaction
     # Assign attributes for Comment Reaction
    assign_attributes
    @record.save!
  end

  private

  def build_comment_reaction
    CommentReaction.new
  end

  # TODO: Need to add condition for post_id
  def assign_attributes
    @record.assign_attributes(
      user_id: user_id,
      comment_id: comment_id,
      reaction_type: reaction_type
    )
  end
end