# Comment channel to pub/sub updates regarding comment object
class CommentsChannel < ApplicationCable::Channel
  def follow(data)
    # when new comment is created we get post_id in params
    # When comment is update we get post_id and comment_id in params
    return unless data['post_id'].present?

    stream_from "post:#{data['post_id']}:comments"
  end
end
