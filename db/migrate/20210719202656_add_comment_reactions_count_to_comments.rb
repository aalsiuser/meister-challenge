class AddCommentReactionsCountToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :comment_reactions_count, :integer
  end
end
