class CommentReaction < ApplicationRecord
  belongs_to :comment, counter_cache: true
  belongs_to :user

  validates_presence_of :reaction_type
  # User has_one Comment Reaction in scope of Comment
  # So user has only one Comment Reaction for one comment
  validates :user_id, uniqueness: { scope: :comment_id }

  enum reaction_type: %i[like smile thumbs_up]

  after_save :broadcast_notification

  def broadcast_notification
    # My thought process over her was we broadcast newly reaction for comment based on comment id
    ActionCable.server.broadcast("comment:#{comment_id}:reactions", self)
  end
end

# == Schema Information
#
# Table name: comment_reactions
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  comment_id :bigint
#  reaction_type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#