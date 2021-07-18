module CommentHelper
  include ActiveSupport::Concern

  def create_update_comment
    form = CommentForm.new(**comment_params)
    form.save
    form.record
  end
end