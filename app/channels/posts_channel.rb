class PostsChannel < ApplicationCable::Channel
  def subscribed
    return unless params[:post_id].present?

    stream_from "post_#{params[:post_id]}"
  end
end
