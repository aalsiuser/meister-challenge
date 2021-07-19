class CommentReactionsChannel < ApplicationCable::Channel
  def follow(data)
    return unless data['comment_id'].present?

    stream_from "comment:#{data['comment_id']}:reactions"
  end
end
