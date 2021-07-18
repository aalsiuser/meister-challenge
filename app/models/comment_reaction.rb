class CommentReaction < ApplicationRecord
  belongs_to :comment_id
  belongs_to :user_id

  enum reaction: [:smile, :like, :thumbs_up]
end

# == Schema Information
#
# Table name: comment_reactions
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  comment_id :bigint
#  reaction   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#