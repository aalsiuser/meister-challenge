class PostsChannel < ApplicationCable::Channel
  def follow(data)
    return unless data['post_id'].present?

    stream_from "post_#{params['post_id']}"
  end
end
