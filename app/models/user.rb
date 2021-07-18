class User < ApplicationRecord
  validates_presence_of :first_name, :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :posts, foreign_key: :author_id, dependent: :destroy
end
