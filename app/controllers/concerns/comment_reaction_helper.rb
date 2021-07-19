# frozen_string_literal: true
module CommentReactionHelper
  extend ActiveSupport::Concern

  def create_comment_reaction
    form = CommentReactionForm.new(**reaction_params)
    form.save
    form.record
  end
end
