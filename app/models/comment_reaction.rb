class CommentReaction < ApplicationRecord
  validates_presence_of :reaction_type
  belongs_to :comment
  belongs_to :user

  enum reaction_type: %i[like smile thumbs_up]

  after_save :broadcast_notification

  def broadcast_notification
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