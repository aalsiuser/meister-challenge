class PostForm
  extend Dry::Initializer[undefined: false]

  # Mandatory Attributes
  option :title
  option :content
  option :summary
  option :user_id

  # Optional Attributes
  option :id, optional: true

  attr_reader :record

  def save
    @record = build_post
     # Assign attributes for post
     assign_attributes
     @record.save!
  end

  private

  def build_post
    id.present? ? Post.find(id) : Post.new
  end

  def save
    @record.assing_attributes(
      title: title,
      content: content,
      summary: summary,
      author_id: user_id
    )
  end
end
