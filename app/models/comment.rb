class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :post, counter_cache: true
  has_many :comment_reactions, dependent: :destroy
  
  validates_presence_of :content

  after_create :broadcast_notification

  def broadcast_notification
    # My thought process over here was we notify users real time only when the new comment is added to the post
    # So braodcasted message in after_create callback
    ActionCable.server.broadcast("post:#{post_id}:comments", self)
  end
end

# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :string(255)
#  date       :datetime
#  post_id    :bigint
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#