class CommentForm
  extend Dry::Initializer[undefined: false]

  # Mandatory Attributes
  option :content
  option :user_id

  # Optional Attributes
  option :id, optional: true
  option :post_id, optional: true

  attr_reader :record

  def save
    @record = build_comment
     # Assign attributes for Comment
     assign_attributes
     @record.save!
  end

  private

  def build_comment
    id.present? ? Comment.find(id) : Comment.new
  end

  # TODO: Need to add condition for post_id
  def assign_attributes
    @record.assign_attributes(
      content: content,
      user_id: user_id,
      post_id: post_id
    )
  end
end