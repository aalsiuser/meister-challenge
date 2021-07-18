class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comment_reactions, dependent: :destroy
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