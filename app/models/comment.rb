class Comment < ApplicationRecord
  validates_presence_of :content

  belongs_to :user
  belongs_to :post
  has_many :comment_reactions, dependent: :destroy

  after_create_commit :broadcast_notification

  def broadcast_notification
    payload = {
      id: id,
      post_id: post.id,
      user_name: user.first_name,
      content: content,
      comment_reactions: comment_reactions
    }

    ActionCable.server.broadcast("post:#{post_id}:comments", payload)
  end
end

# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :string(255)
#  date       :datetime
#  post_id    :bigint
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#