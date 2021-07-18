class CreateCommentReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_reactions do |t|
      t.references :user, index: true
      t.references :comment, index: true
      t.integer :reaction_type

      t.timestamps
    end
  end
end
