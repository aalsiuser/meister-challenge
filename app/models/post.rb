class Post < ApplicationRecord
  validates_presence_of :title, :content, :summary

  belongs_to :user, foreign_key: :author_id
  has_many :comments, dependent: :destroy

  enum status: %i[draft inprogress completed published]
end
