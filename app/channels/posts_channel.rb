# PostChannel to pub/sub updates regarding post object
class PostsChannel < ApplicationCable::Channel
  def follow(data)
    return unless data['post_id'].present?

    stream_from "post_#{data['post_id']}"
  end
end
