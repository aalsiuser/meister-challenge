class CommentReaction < ApplicationRecord
  validates_presence_of :reaction_type
  belongs_to :comment
  belongs_to :user

  enum reaction_type: %i[like smile thumbs_up]
end

# == Schema Information
#
# Table name: comment_reactions
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  comment_id :bigint
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#