class Post < ApplicationRecord
  validates_presence_of :title, :content, :summary
  validates_uniqueness_of :title

  belongs_to :user, foreign_key: :author_id
  has_many :comments, dependent: :destroy

  enum status: %i[draft inprogress completed published]
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
