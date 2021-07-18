module PostsHelper
  def create_update_post(params)
    form = PostForm.new(params)
    form.save
    form.record
  end
end