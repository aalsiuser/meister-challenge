class CommentForm
  extend Dry::Initializer[undefined: false]

  # Mandatory Attributes
  option :content
  option :user_id
  option :post_id

  # Optional Attributes
  option :id, optional: true

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

  def assign_attributes
    @record.assign_attributes(
      content: content,
      user_id: user_id,
      post_id: post_id
    )
  end
end

