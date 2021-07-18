module PostsHelper
  include ActiveSupport::Concern

  def create_update_post
    form = PostForm.new(**post_params)
    form.save
    form.record
  end
end