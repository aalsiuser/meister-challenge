# Post model with its validations on columns and associations
class Post < ApplicationRecord
  validates_presence_of :title, :content, :summary
  validates_uniqueness_of :title

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, dependent: :destroy

  enum status: %i[draft inprogress completed published]

  after_update :broadcast_notification

  def broadcast_notification
    # Broadcast updated post object to below channel
    ActionCable.server.broadcast("post_#{id}", self)
  end
end

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string(255)
#  summary    :text(65535)
#  content    :text(65535)
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default("draft")
