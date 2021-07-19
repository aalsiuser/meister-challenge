class CommentReactionsChannel < ApplicationCable::Channel
  def subscribed
    return unless params[:comment_id].present?

    stream_from "comment:#{params[:comment_id]}:reactions"
  end
end
