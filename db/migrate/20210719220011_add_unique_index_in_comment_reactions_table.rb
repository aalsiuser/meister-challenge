class AddUniqueIndexInCommentReactionsTable < ActiveRecord::Migration[6.1]
  def change
    add_index :comment_reactions, [:user_id, :comment_id], unique: true
  end
end
