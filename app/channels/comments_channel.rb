class CommentsChannel < ApplicationCable::Channel
  def subscribed
    # when new comment is created we get post_id in params
    # When comment is update we get post_id and comment_id in params
    return unless params[:post_id].present?

    stream_from "post:#{params[:post_id]}:comments"
  end
end
