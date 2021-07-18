class User < ApplicationRecord
  validates_presence_of :first_name, :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_uniqueness_of :email

  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments
  has_one :comment_reaction
end

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
