module CommentHelper

  def create_update_comment(params)
    form = CommentForm.new(params)
    form.save
    form.record
  end
end